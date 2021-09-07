class Profile < ApplicationRecord
  belongs_to :portfolio

  has_one_attached :photo

  validates :title, :name, presence: true
  validates :photo, file: { max_size_in_bytes: 3000, mime_types: %i[jpg png] }
end
