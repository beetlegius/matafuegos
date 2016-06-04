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

FactoryGirl.define do
  factory :sector do
    sequence(:name) { |i| "Sector #{i}" }
    latitude { [-1, 1].sample * rand(-34.0..54.0) }
    longitude { [-1, 1].sample * rand(-34.0..54.0) }

    factory :invalid_sector do
      name nil
    end
  end
end
