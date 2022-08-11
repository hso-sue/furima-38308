FactoryBot.define do
  factory :item do
    item_name { Faker::Name.name }
    introduction { Faker::Lorem.sentence }
    item_category_id {'6'}
    item_condition_id {'3'}
    postage_payer_id {'2'}
    sender_area_id {'40'}
    preparation_id {'3'}
    price {'66666'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
