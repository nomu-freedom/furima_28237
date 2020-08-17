class OrdersController < ApplicationController
  before_action :set_items, only: [:index, :create, :move_to_root_path]
  before_action :move_to_root_path
  before_action :move_to_new_path

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(item_id: order_params[:item_id], user_id: order_params[:user_id], postal_code: order_params[:postal_code], shipping_origin_id: order_params[:shipping_origin_id], city: order_params[:city], house_number: order_params[:house_number], building_number: order_params[:building_number], phone_number: order_params[:phone_number])
    if @order.valid?
      pay_item
      @order.save
      unless @item.sold
        @item.update(sold: true)
      end 
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:token, :postal_code, :shipping_origin_id, :city, :house_number, :building_number, :phone_number, :item_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def only_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: only_params[:token],
      currency: "jpy"
    )
  end

  def set_items
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_new_path
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
