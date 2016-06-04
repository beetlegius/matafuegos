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

require 'rails_helper'

RSpec.describe Extinguisher, type: :model do

  subject(:extinguisher) { FactoryGirl.build(:extinguisher) }

  ####################
  # VALIDATIONS
  ####################

  describe 'is invalid' do
    after(:example) { expect(extinguisher).not_to be_valid }

    it 'without sector' do
      extinguisher.sector = nil
    end

    it 'without kind' do
      extinguisher.kind = nil
    end

    it 'without expiration_at' do
      extinguisher.expiration_at = nil
    end

    it 'without an included kind' do
      extinguisher.kind = SecureRandom.hex
    end
  end

  ####################
  # RELATIONS
  ####################

  it 'belongs to a sector' do
    expect(extinguisher).to respond_to(:sector)
  end

  ####################
  # CALLBACKS
  ####################

  ####################
  # METHODS
  ####################

  context '#renew' do

    it 'respond to method' do
      expect(extinguisher).to respond_to(:renew)
    end

    it 'updates the expiration at' do
      expect{extinguisher.renew}.to change{extinguisher.expiration_at}.by(365)
    end

  end

  context '#is_expiring?' do

    it 'respond to method' do
      expect(extinguisher).to respond_to(:is_expiring?)
    end

    it 'returns true if expirates in less than the limit constant' do
      extinguisher.expiration_at = Extinguisher::EXPIRATION_LIMIT
      expect(extinguisher.is_expiring?).to be(true)
    end

    it 'returns false if expirates in more than the limit constant' do
      extinguisher.expiration_at = Extinguisher::EXPIRATION_LIMIT + 1.day
      expect(extinguisher.is_expiring?).to be(false)
    end

  end

end
