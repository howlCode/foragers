FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password 'example_password'
  end
end