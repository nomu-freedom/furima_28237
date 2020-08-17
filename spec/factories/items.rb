FactoryBot.define do
  factory :item do
    name {"パソコン"}
    explanation {"パソコンです"}
    category_id {"2"}
    status_id {"2"}
    delivery_fee_id {"2"}
    shipping_origin_id {"2"}
    until_shipping_id {"2"}
    price {"3000"}
    association :user
  end
end
