FactoryBot.define do
  factory :education do
    title { FFaker::Lorem.word }
    description { FFaker::Lorem.paragraph }
    start_date { Time.now - rand(1..5).year }
    end_date { Time.now }
    institution { FFaker::Company.name }
 
    portfolio
  end
end
