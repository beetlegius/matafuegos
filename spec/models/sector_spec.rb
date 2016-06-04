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

require 'rails_helper'

RSpec.describe Sector, type: :model do
  subject(:sector) { FactoryGirl.build(:sector) }

  ####################
  # VALIDATIONS
  ####################

  describe "is invalid" do
    after(:example) { expect(sector).not_to be_valid }

    it 'without name' do
      sector.name = nil
    end

    it 'without a numeric latitude' do
      sector.latitude = SecureRandom.hex
    end

    it 'without a numeric longitude' do
      sector.longitude = SecureRandom.hex
    end

  end

  ####################
  # RELATIONS
  ####################

  it 'has many extinguishers' do
    expect(sector).to respond_to(:extinguishers)
  end

end
