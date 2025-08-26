FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.unique.email}
    address {Faker::Address.full_address}
    image {Faker::Avatar.image}
    password {'password1234'}
    password_confirmation {'password1234'}
    created_at {Time.now}
    updated_at {Time.now}
    
  end
end
