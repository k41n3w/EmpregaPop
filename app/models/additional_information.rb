class AdditionalInformation < ApplicationRecord
  belongs_to :portfolio
  validates :title, :description, presence: true
end
