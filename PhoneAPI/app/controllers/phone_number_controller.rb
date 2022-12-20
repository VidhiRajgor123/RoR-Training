class PhoneNumberController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @phone_numbers = PhoneNumber.all
        if @phone_numbers.present?
            json_response({ status: true, message: "Allocated phone number list", phone_numbers: @phone_numbers.pluck(:phone_number) })
        else
            json_response({ success: false, message: "Not found allocated phone numbers" }, :not_found)
        end
    end

    def generate_number
        phone = params[:phone]
        if phone.present?
            phone = phone.gsub(/-/,"")
            check_phone = PhoneNumber.where(phone_number:phone)
            if check_phone.present?
                random_phone = PhoneNumber.get_random_number
                result = PhoneNumber.create(phone_number:random_phone)
                if result.save
                    json_response({ status: true, message: "#{phone} is not available, New phone number is allocated.", phone_number: result.phone_number })
                else
                    json_response({ success: false, message: "Error while creating phone number", errors: result.errors }, :unprocessable_entity)
                end
            else
                result = PhoneNumber.new({phone_number: phone})
                if result.save
                    json_response({ status: true, message: "Your requested number is allocated", phone_number: result.phone_number })
                else
                    json_response({ success: false, message: "Error while creating phone number", errors: result.errors }, :unprocessable_entity)
                end
            end
        else
            random_phone = PhoneNumber.get_random_number
            result = PhoneNumber.create(phone_number:random_phone)
            if result.save 
                json_response({ status: true, message: "New phone number is allocated", phone_number: result.phone_number })
            else
                json_response({ success: false, message: "Error while creating phone number", errors: result.errors }, :unprocessable_entity)
            end
        end
    end
end
