FactoryBot.define do
  factory :order_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { Faker::Lorem.sentence }
    house_number   { Faker::Lorem.sentence }
    building_name  { Faker::Lorem.sentence }
    phone_number   { '09012345678' }
    order_id       { Faker::Number.between(from: 1, to: 20) }
  end
end
