FactoryBot.define do
  factory :item do
    item_name { 'ライト' }
    explanation { 'とても明るいです' }
    price { '300' }
    category_id { '2' }
    condition_id { '2' }
    delivery_charge_id { '2' }
    ship_from_area_id { '2' }
    delivery_day_id { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
