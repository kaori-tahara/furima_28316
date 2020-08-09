FactoryBot.define do
  factory :user do
    first_name {Faker::Japanese::Name.first_name}
    family_name {Faker::Japanese::Name.last_name}
    first_furigana {Gimei.first.katakana}
    family_furigana {Gimei.last.katakana}
    birth {Faker::Date.birthday}
    nickname {Faker::Internet.username}
    email {Faker::Internet.free_email}

    password = Faker::Internet.password(min_length: 6,mix_case: true)
    password {password}
    password_confirmation {password}
  end
end