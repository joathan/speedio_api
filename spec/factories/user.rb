FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'user@example.com' }
    password { '123456' }
  end
end
