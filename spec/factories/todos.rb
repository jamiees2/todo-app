# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    title Faker::Lorem.sentence
    completed false
  end
end
