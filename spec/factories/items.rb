FactoryBot.define do
  factory :item do
    content {Faker::Lorem.sentence}
    association :user 
    association :room
  end
end

# とりあえず入れているが変更する