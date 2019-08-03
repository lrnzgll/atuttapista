class Town < ApplicationRecord
  belongs_to :county

  validates :name, presence: true
  validates :slug, presence: true
  validates :zone, presence: true
  validates_inclusion_of :capoluogo, in: [true, false]
  validates :region_name, presence: true
  validates :plate_slug, presence: true
  validates :population, presence: true
end
