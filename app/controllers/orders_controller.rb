class OrdersController < ApplicationController
   def new
    @order = current_cart.order
  end

  def create
    @order = current_cart.order

    if @order.update(order_params)
     session[:cart_token] = nil
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit!
  end
end
