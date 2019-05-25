class RouteLocation < ApplicationRecord
  belongs_to :route
  has_many :addresses, as: :addressable, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
