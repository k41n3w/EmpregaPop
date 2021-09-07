class About < ApplicationRecord
  belongs_to :portofolio
  validates :description, presence: true
end
