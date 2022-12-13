class OrdersController < ApplicationController
    def create
        if user_signed_in?
            # puts params.inspect
            # puts params[:order][:total_amount]
            # abort
            @user = User.where(id:current_user.id).first
            @order = Order.new(:user_id => current_user.id, :total_amount => params[:order][:total_amount], :total_qty => params[:order][:total_qty], :status=>'ordered', :order_date => DateTime.now, :name => params[:order][:name], :mobile => params[:order][:mobile], :address => params[:order][:address], :paymentmethod => params[:order][:paymentmethod])
            if @order.save
                # Store individual item in order_items
                @cart = Cart.where(user_id: current_user.id).all
                @cart.each do |c|
                    order_item = OrderItem.new(:user_id => current_user.id, :order_id => @order.id, :product_id => c.product_id, :price => c.price,:qty => c.qty)
                    order_item.save
                end
                # remove items from cart
                @cart.destroy_all
                # send email to user for order
                @order_items = OrderItem.where(order_id:@order.id).all
                OrderMailer.order_confirmation(@user, @order, @order_items).deliver
                redirect_to '/history'
            end
        else
            redirect_to '/users/sign_in'
        end
    end

    def order_detail
        if user_signed_in?
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order_id:params[:id]).all
        render :template => 'orders/detail'
        else
            redirect_to '/users/sign_in'
        end
    end

    def history
        if user_signed_in?
            @orders = Order.where(:user_id => current_user.id).all
            render :template => 'orders/history'
        else
            redirect_to '/users/sign_in'
        end
    end
end

