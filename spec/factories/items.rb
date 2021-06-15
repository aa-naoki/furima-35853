FactoryBot.define do
  factory :item do
    item_name             { Faker::Lorem.sentence }
    explanation           { Faker::Lorem.paragraph }
    price                 { Faker::Number.within(range: 300..9_999_999) }
    category_id           { 2 }
    status_id             { 2 }
    shipping_fee_id       { 2 }
    shipping_area_id      { 2 }
    shipping_day_id       { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
