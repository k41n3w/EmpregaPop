FactoryBot.define do
  factory :experience do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.paragraph }
    start_date { Time.now - rand(1..5).year }
    end_date { Time.now }
    company { FFaker::Company.name }
 
    portfolio
  end
end
