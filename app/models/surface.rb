class Surface < ApplicationRecord
  belongs_to :route, inverse_of: :surfaces

  validates :name, presence: true
  validates_inclusion_of :name, in: %w(asfalto misto ghiaia terra)
  validates :name, uniqueness: { scope: :route_id }
end
