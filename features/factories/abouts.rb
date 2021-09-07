FactoryBot.define do
  factory :about do
    description  { FFaker::Lorem.paragraph }
    portfolio
  end
end
