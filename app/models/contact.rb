class Contact < ApplicationRecord
  belongs_to :portfolio
 
  validates :phone, presence: true
  validates :email, presence: true
end
