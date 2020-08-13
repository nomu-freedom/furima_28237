class OrdersController < ApplicationController

  def index
    
  end
  def create
    @order = Order.new#(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def order_params
    params.permit(:price, :token).merge(user_id: current_user.id, item_id: @item.id )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: oreder_params[:price],
      card: order_params[:token],
      currency: "jpy"
    )
  end
end
