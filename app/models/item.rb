class Item < ApplicationRecord
  
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000 }
  end

  
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :delivery_fee_id
  validates :shipping_origin_id
  validates :status_id
  validates :until_shipping_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :status
  belongs_to_active_hash :until_shipping

  belongs_to :user
  has_one_attached :avatar
end
