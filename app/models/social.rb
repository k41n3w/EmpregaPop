class Social < ApplicationRecord
  belongs_to :portfolio
    
  enum kind: [:facebook, :twitter, :linkedin, :github, :other, :instagram]
  validates :url, presence: true, http_url: true
end
