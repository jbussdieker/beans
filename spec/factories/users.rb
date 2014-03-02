FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { "asdfblah" }
  end
end
