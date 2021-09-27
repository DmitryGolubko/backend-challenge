FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' }
    role { 'client' }

    trait :admin_user do
      role { 'admin' }
    end


    factory :admin_user, traits: %i[admin_user]
  end
end
