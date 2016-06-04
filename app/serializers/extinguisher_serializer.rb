# == Schema Information
#
# Table name: extinguishers
#
#  id            :integer          not null, primary key
#  kind          :string
#  expiration_at :date
#  sector_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ExtinguisherSerializer < ActiveModel::Serializer
  attributes :id, :kind, :expiration_at
  belongs_to :sector
end
