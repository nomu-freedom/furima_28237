class ItemsController < ApplicationController
before_action :move_to_index, expect: [:index, :show]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    if Item.create(item_params)
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :category_id, :status_id, :delivery_fee_id, :until_shipping_id, :shipping_origin_id, :price )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
