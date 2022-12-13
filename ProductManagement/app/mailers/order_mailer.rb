class OrderMailer < ApplicationMailer
    default from: "ingennext@gmail.com"
    def order_confirmation(user, order,order_items)
        # puts user.email
        # puts order
        # abort
        @user = user
        @order = order
        @order_items = order_items
        mail(to: @user.email, subject: 'Order has been placed')
    end
end
