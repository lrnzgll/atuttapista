class Town < ApplicationRecord
  belongs_to :county
  belongs_to :region

  validates :name, presence: true
  # validates :lonlat, presence: :true
end
