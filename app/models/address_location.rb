# frozen_string_literal: true

class AddressLocation < ApplicationRecord
  has_one :addresses, dependent: :destroy

  validates :address1, presence: :true
  validates :postal_code, presence: :true
  validates :town, presence: :true
  validates :latitude, presence: :true
  validates :longitude, presence: :trues

  before_validation(on: :create) do
    coordinates = Geocoder.coordinates("#{self.address1} #{self.town} #{self.postal_code}")
    self.latitude = coordinates[0]
    self.longitude = coordinates[1]
  end

end
