FactoryBot.define do
  factory :hobby do
    title { FFaker::Lorem.word }
    percent { rand(0..100) }

    portfolio
  end
end
