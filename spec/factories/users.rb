FactoryBot.define do
  factory :user do
    first_name { Gimei.name.first }
    family_name { Gimei.name.last }
    first_furigana { Gimei.first.katakana }
    family_furigana { Gimei.last.katakana }
    birth { Faker::Date.birthday }
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }

    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password { password }
    password_confirmation { password }
  end
end
