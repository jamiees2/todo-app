# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

    factory :user_with_todos do
      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:todo, 5, user: user)
      end
    end
  end
end
