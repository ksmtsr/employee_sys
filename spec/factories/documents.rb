FactoryBot.define do
    factory :document do
        # ランダムな文章が生成される
      description { Faker::Lorem.sentence }
      association :employee, factory: :employee
    end
  end