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

class SectorSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude
end
