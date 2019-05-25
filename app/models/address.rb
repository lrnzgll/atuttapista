class Address < ApplicationRecord
  belongs_to :address_location
  belongs_to :addressable, polymorphic: true
end
