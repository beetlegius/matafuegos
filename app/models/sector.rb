# == Schema Information
#
# Table name: sectors
#
#  id         :integer          not null, primary key
#  name       :string
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sector < ApplicationRecord
  has_many :extinguishers

  validates :name, presence: true
  validates :latitude, :longitude, numericality: true, allow_nil: true

  default_scope -> { order :name }
end
