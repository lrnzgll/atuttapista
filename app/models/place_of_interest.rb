class PlaceOfInterest < ApplicationRecord
  belongs_to :county
  has_many :addresses, as: :addressable, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
