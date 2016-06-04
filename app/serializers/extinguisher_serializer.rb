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
  include ExtinguishersHelper

  attributes :id, :kind, :expiration_at
  attributes :expiration_at_in_words, :tr_class, :label_class
  attribute :is_expiring?, key: :is_expiring
  belongs_to :sector

  def expiration_at_in_words
    scope.distance_of_time_in_words_to_now object.expiration_at
  end

  def tr_class
    extinguisher_tr_class(object)
  end

  def label_class
    extinguisher_label_class(object)
  end

end
