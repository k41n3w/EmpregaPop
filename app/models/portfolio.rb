class Portfolio < ApplicationRecord
  belongs_to :user

  has_one :profile
  has_one :about

  has_many :blocks
  has_many :portfolio_tags
  has_many :tags, through: :portfolio_tags
  has_many :educations
  has_many :experiences
  has_many :hobbies
  has_many :skills
  has_many :languages
  has_many :socials
  has_many :contacts
  has_one :additional_informations
end
