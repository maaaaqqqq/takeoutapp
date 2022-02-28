FactoryBot.define do
  factory :item do
    name         { Faker::Food.dish }
    text         { Faker::Lorem.sentence }
    price        { Faker::Number.number(digits: 5) }
    category_id  { Faker::Number.between(from: 2, to: 7) }
    association  :shop

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image_curry.png'), filename: 'test_image_curry.png')
    end
  end
end
