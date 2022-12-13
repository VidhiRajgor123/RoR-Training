class CartsController < ApplicationController
    def index
        if user_signed_in?
            @cart = Cart.where(user_id: current_user.id).all
        else
            redirect_to '/users/sign_in'
        end   
    end
    def add_to_cart
        if user_signed_in?
            cart = Cart.where('product_id= ?',params[:product_id]).first
            product = Product.where('id= ?',params[:product_id]).first
            if cart
                cart.qty = cart.qty + 1
                if cart.save
                    redirect_to '/carts'
                end
            else
                @cart = Cart.new(:product_id => params[:product_id],:user_id => current_user.id, :qty => 1,:price => product.price)
                if @cart.save
                    redirect_to '/carts'
                end
                # @cart = Cart.new do |c|
                #     c.product_id = params[:product_id]
                #     c.user_id = current_user.id
                #     c.qty = 1
                #     c.price = product.price
                # end
            end
        else
            redirect_to '/users/sign_in'
        end
    end

    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
        redirect_to "/carts", status: :see_other
    end
end
