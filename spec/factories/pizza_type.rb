FactoryBot.define do
  factory :pizza_type do
    name { 'Pepperoni' }
    price { 10.00 }

    trait :without_name do
      name { ' ' }
    end

    trait :without_price do
      price { nil }
    end

    factory :pizza_type_without_name, traits: %i[without_name]
    factory :pizza_type_without_price, traits: %i[without_price]
  end
end
