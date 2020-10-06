FactoryBot.define do
  factory :user do
    nickname              {"maria"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"谷"}
    first_name            {"まりあ"}
    family_name_kana      {"タニ"}
    first_name_kana       {"マリア"}
    birthday              {"2000.1.1"}
  end
end