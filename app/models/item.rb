class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :delivery_fee, :shipping_origin, :status, :until_shipping

  with_options precense: true do
  validates :category, :delivery_fee, :shipping_origin, :status, :until_shipping
  end

  with_options numericality: { other_than: 1 } do
  validates :category_id, :delivery_fee_id, :shipping_origin_id, :status_id, :until_shipping_id
  end

  belongs_to :user
  has_one_attached :avatar
end
