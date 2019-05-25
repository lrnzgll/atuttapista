class Region < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  belongs_to :country

  has_many :region_routes, dependent: :destroy
  has_many :counties, dependent: :destroy

  has_many :routes, through: :region_routes
  has_many :towns, through: :counties

  validates :slug, presence: true
  validates :name, presence: true
end
