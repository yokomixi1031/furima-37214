FactoryBot.define do
  factory :buyer_address do
    postal_code { '123-4567' }
    ship_from_area_id { 3 }
    municipalities { '青山市' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone { '09012345678' }
    user_id {1}
    item_id {4}
  end
end
