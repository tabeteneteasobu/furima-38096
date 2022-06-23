FactoryBot.define do
  factory :item do
    item_name        {Faker::Lorem.sentence}
    description      {Faker::Lorem.sentence}
    category_id      {Faker::Number.between(from: 1, to: 11) }
    condition_id     {Faker::Number.between(from: 1, to: 11) }
    postage_payer_id {Faker::Number.between(from: 1, to: 11) }
    prefecture_id    {Faker::Number.between(from: 1, to: 11) }
    shipment_date_id {Faker::Number.between(from: 1, to: 11) }
    price            {Faker::Commerce.price(range: 300..9999999, as_string: true)}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end

