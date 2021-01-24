FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    company_name          {Faker::Company.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
  end
end