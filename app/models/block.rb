class Block < ApplicationRecord
  belongs_to :portfolio

  enum kind: { profile: 1, about: 2, education: 3, experience: 4, hobby: 5, skill: 6,
               language: 7, social: 8, contact: 9, additional_information: 10 }

  enum side: %i[left right]
  validates :position, presence: true, uniqueness: { scope: :portfolio_id }

  validates :kind, presence: true
  validates :kind, uniqueness: { scope: :portfolio_id }
end
