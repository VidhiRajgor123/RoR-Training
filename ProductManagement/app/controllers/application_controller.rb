class ApplicationController < ActionController::Base
    before_action :cart_count
    def cart_count
        if user_signed_in?
            @cart = Cart.where(user_id:current_user.id).all
        end
    end
end
