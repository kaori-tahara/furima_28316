FactoryBot.define do
  factory :user_transaction do
      zip { "000-0000" }
      city { Gimei.city.kanji }
      address { Faker::Lorem.sentence }
      phone_number { "09021231234" }
      prefecture_id { Faker::Number.within(range: 2..48) }

  end


end

