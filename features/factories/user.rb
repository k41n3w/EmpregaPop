FactoryBot.define do
  factory :user do
    email { FFaker::Internet.unique.email }
    password '12345678'
    password_confirmation '12345678'
  end
end
