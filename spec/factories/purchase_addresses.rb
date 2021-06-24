FactoryBot.define do
  factory :purchase_address do
    postal_code            { '123-4567' }
    shipping_area_id       { 2 }
    municipality           { '北区赤羽' }
    house_number           { '1-1' }
    building               { '赤羽ハイツ' }
    phone_number           { '09012345678' }
    token                  { 'token_asdfghjkl00000000000000000' }
  end
end