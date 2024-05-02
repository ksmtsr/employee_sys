FactoryBot.define do
    factory :document do
      description { Faker::Lorem.sentence }
      association :employee, factory: :employee
      
    end
  end