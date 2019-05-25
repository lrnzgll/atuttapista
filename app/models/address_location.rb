class AddressLocation < ApplicationRecord
  belongs_to :town
  has_many :addresses, dependent: :destroy

  validates :address1, presence: :true
  validates :postal_code, presence: :true
end
