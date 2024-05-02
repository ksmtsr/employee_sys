FactoryBot.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { Faker::Japanese::Name.first_name }
    last_name_kana { Faker::Japanese::Name.last_name }
    postal_code { Faker::Address.postcode }
    address { Faker::Address.full_address }
    telephone_number { Faker::PhoneNumber.phone_number }
    birthday { Faker::Date.birthday }
    start_date { Faker::Date.backward(days: 365) }
  end

  factory :valid_employee, class: Employee do
    last_name { "田中" }
    first_name { "太郎" }
    last_name_kana { "タナカ" }
    first_name_kana { "タロウ" }
    birthday { Date.new(1990, 1, 1) }
    postal_code { "1234567" }
    address { "東京都渋谷区" }
    telephone_number { "09012345678" }
    start_date { Date.today }
    end_date { nil }
  end
  
  factory :invalid_employee, class: Employee do
    first_name { '' } 
    last_name { '' }
    first_name_kana { '' }
    last_name_kana { '' }
    birthday { nil }
    postal_code { '' }
    address { '' }
    telephone_number { '' }
  end
end
