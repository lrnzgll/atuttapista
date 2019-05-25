class County < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged
  belongs_to :region

  has_many :county_routes, dependent: :destroy
  has_many :place_of_interests, dependent: :destroy
  has_many :routes, through: :county_routes
  has_many :towns, dependent: :destroy

  validates :slug, presence: true
  validates :name, presence: true
end
