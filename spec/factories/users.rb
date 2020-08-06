FactoryBot.define do
  gimei = Gimei.name
  factory :user do
    nickame {Faker::Name.nickame}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {gimei.last.kanji}
    last_name {gimei.first.kanji}
    family_name_leading {gimei.last.katakana}
    last_name_leading {gimei.first.katakana}
    birthday {Faker::Date}
  end
end
