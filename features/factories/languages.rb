FactoryBot.define do
  factory :language do
    title { FFaker::Lorem.word }
    percent { rand(0..100) }

    portfolio
  end
end
