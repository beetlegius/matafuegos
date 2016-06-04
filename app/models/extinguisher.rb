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

class Extinguisher < ApplicationRecord

  KINDS = [A = 'A', AB = 'AB', ABC = 'ABC', BC = 'BC', D = 'D', K = 'K']
  EXPIRATION_LIMIT = 2.weeks.from_now.to_date

  belongs_to :sector

  validates :kind, :expiration_at, presence: true
  validates :kind, inclusion: { in: KINDS }

  scope :from_sector, ->(sector_id) { where sector_id: sector_id if sector_id.present? }
  scope :is_expiring, -> { where("expiration_at < :date", date: EXPIRATION_LIMIT).order(:expiration_at) }

  def renew
    update expiration_at: expiration_at + 1.year
  end

  def is_expiring?
    expiration_at <= EXPIRATION_LIMIT
  end

end
