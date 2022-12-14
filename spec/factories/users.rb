FactoryBot.define do
  factory :user do
    nickname { '大野 太郎' }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '大野' }
    last_name_kana { 'カナ' }
    first_name { '太郎' }
    first_name_kana { 'カナ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
