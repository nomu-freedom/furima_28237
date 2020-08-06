FactoryBot.define do
  gimei = Gimei.name
  factory :user do
    nickname {Faker::JapaneseMedia::OnePiece.character}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    family_name {gimei.last.kanji}
    last_name {gimei.first.kanji}
    family_name_leading {gimei.last.katakana}
    last_name_leading {gimei.first.katakana}
    birthday {Faker::Date.in_date_period(year: 2018, month: 2)}
  end
end
