FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department(max: 2, fixed_amount: true) }
    
  end
end