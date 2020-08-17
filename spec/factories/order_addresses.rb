FactoryBot.define do
  factory :order_address do
    number             { 4242424242424242}
    exp_month          { 3 }
    exp_year           { 23 }
    cvc                { 123 }
    postal_code        { "123-4567" }
    shipping_origin_id { 15 }
    city               { "熊本市中央区" }
    house_number       { "日本橋1丁目" }
    building_number    { "大江ビル1-3-306" }
    phone_number       { 99087654321 }
  end
end
