FactoryBot.define do
  factory :item do
    item_name              { Faker::Lorem.words }
    explanation            { Faker::Lorem.sentence }
    category_id            { 2 }
    quality_id             { 2 }
    delivery_charge_id     { 2 }
    province_id            { 2 }
    shipping_date_id       { 2 }
    price                  { Faker::Number.number(digits: 5) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/item-sample.png'), filename: 'test_image.png')
    end
  end
end
