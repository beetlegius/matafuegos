class Sector < ApplicationRecord
  has_many :extinguishers

  validates :name, presence: true
  validates :latitude, :longitude, numericality: true

  default_scope -> { order :name }
end
