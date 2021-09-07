FactoryBot.define do
  factory :tag do
    title { FFaker::Lorem.unique.word }
  end
end
