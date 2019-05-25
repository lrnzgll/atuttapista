class Kind < ApplicationRecord
  belongs_to :route,inverse_of: :kinds
  
  validates :name, presence: true
  validates_inclusion_of :name, in: %w(strada sentiero ciclopedonale ciclabile)
  validates :name, uniqueness: { scope: :route_id }
end
