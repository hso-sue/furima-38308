FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {Faker::Name.last_name}
    last_name_kana {Faker::Name.last_name}
    first_name {Faker::Name.first_name}
    first_name_kana {Faker::Name.first_name}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end