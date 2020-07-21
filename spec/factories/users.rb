FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { "password" }
  end

  trait :admin do
    admin { true }
  end
end