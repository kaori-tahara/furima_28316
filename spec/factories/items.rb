FactoryBot.define do
  factory :item do
    name { Faker::String.random(length: 1..40) }
    text { Faker::Lorem.sentence }
    picture { Faker::Lorem.sentence }
    price { Faker::Number.within(range: 300..9_999_999) }
    category_id { Faker::Number.within(range: 2..11) }
    item_statue_id { Faker::Number.within(range: 2..7) }
    shipping_charge_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    period_until_shipping_id { Faker::Number.within(range: 2..4) }

    association :user
  end
end
