class Experience < ApplicationRecord
  belongs_to :portfolio

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :company, presence: true
  validates_with DateIntervalValidator
end
