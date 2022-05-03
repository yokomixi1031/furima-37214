FactoryBot.define do
  factory :user do
    nickname { '鈴木' }
    email {Faker::Internet.free_email}
    password { 'test1234' }
    password_confirmation { password }
    last_name { '鈴木' }
    first_name { '太郎' }
    last_name_furigana { 'スズキ' }
    first_name_furigana { 'タロウ' }
    birth_day { '1996-06-05' }
  end
end
