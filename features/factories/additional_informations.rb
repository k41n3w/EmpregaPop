FactoryBot.define do
  factory :additional_information do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.paragraph }

    portfolio
  end
end
