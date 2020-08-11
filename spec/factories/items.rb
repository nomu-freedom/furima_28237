FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name {Faker::Game.title }
    explanation {Faker::Lorem.sentence}
    category_id {Faker::Number.within(range: 2..11)}
    status_id {Faker::Number.within(range: 2..3)}
    delivery_fee_id {Faker::Number.within(range: 2..48)}
    shipping_origin_id {Faker::Number.within(range: 2..7)}
    until_shipping_id {Faker::Number.within(range: 2..4)}
    price {Faker::Number.within(range: 300..9999999)}
    association :user
  end
end
