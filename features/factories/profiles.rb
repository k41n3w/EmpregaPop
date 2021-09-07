FactoryBot.define do
  factory :profile do
    name         { FFaker::Name.name }
    title        { FFaker::Lorem.word }
    portfolio

    trait :with_photo do
      after :build do |portfolio|
        image = File.open(Rails.root.join('features', 'factories', 'images', 'portfolio-photo.png'))
        portfolio.photo.attach(io: image, filename: 'profile-photo.png')
      end
    end
  end
end
