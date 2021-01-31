FactoryBot.define do
  factory :product do
    name {Faker::Lorem.word}
    status_id { 2 }
    explanation { Faker::Lorem.sentence }
    price { 1000 }
    user

    after(:build) do |product|
      product.image.attach(io: File.open('app/assets/images/camera_gray.png'), filename: 'camera_gray.png')
    end
  end
end