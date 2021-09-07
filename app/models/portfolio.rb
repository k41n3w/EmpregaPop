class Portfolio < ApplicationRecord
  MAX_NUMBER_OF_TAGS = 4

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
  has_many :additional_informations

  validates :slug, presence: true, uniqueness: true
  validates :tags, length: { in: 0..MAX_NUMBER_OF_TAGS, message: "can't have more than #{MAX_NUMBER_OF_TAGS} tags" }

  enum temp_avatar: { blue_robot: 0, green_robot: 1, orange_red_robot: 2, purple_robot: 3, red_robot: 4,
                      yellow_robot: 5 }

  before_create :set_random_temp_avatar

  private

  def set_random_temp_avatar
    avatars_list = Portfolio.temp_avatars.keys
    self.temp_avatar = avatars_list.sample
  end
end
