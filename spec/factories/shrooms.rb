FactoryBot.define do
  factory :shroom do
    association :user
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
    edible { Faker::Boolean }
    image { File.new("#{Rails.root}/spec/support/fixtures/test_image.png") }
  end
end