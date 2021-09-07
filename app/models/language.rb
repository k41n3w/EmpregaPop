class Language < ApplicationRecord
  belongs_to :portfolio
 
  validates :title, presence: true
  validates :percent, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
end
