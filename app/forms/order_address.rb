class OrderAddress

  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :postal_code, :shipping_origin_id, :city, :house_number, :building_number, :phone_number, :user_id, :item_id
  
  with_options presence: true do
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city,         format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :house_number
    validates :phone_number, format: {with: /\A[0-9]{,11}\z/}
  end
  validates :shipping_origin_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    Order.create( user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_origin_id: shipping_origin_id, city: city, house_number: house_number, building_number: building_number, phone_number: phone_number, user_id: user_id, item_id: item_id)
  end

end