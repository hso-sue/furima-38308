FactoryBot.define do
  factory :order_shipinfo do
    post_code { '123-4567' }
    prefectures_id { 2 }
    city { '東京都' }
    address { '都2-2' }
    building_name { '東京ハイツ' }
    telephone_number { '09062827382' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
