class Tag < ApplicationRecord
  has_many :portfolio_tags
  validates :title, presence: true, uniqueness: true
end
