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

FactoryGirl.define do
  factory :extinguisher do
    kind { Extinguisher::KINDS.sample }
    expiration_at { rand(1.day.from_now..60.days.from_now) }
    sector

    factory :invalid_extinguisher do
      kind nil
    end
  end
end
