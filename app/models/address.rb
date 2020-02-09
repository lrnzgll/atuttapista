class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :region
  belongs_to :county
  belongs_to :town

  validates :address1, presence: true
  validates :postal_code, presence: true
  validates :town, presence: true
  validates :region, presence: true
  validates :county, presence: true
  validates :lonlat, presence: true

  scope :not_archived, -> { where(archived_at: nil) }
end
