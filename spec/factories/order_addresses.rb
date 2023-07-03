FactoryBot.define do
  factory :order_address do

    post_code { '123-4567' }
    prefecture { 3 }
    municipality { '東京市' }
    street_address { '1111' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
    
    
    association :order
  end
end
