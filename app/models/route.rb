class Route < ApplicationRecord
  
  acts_as_votable

  has_many :region_routes, inverse_of: :route, dependent: :destroy
  has_many :kinds,inverse_of: :route, dependent: :destroy
  has_many :surfaces,inverse_of: :route, dependent: :destroy
  has_many :route_locations,inverse_of: :route, dependent: :destroy
  has_many :regions, through: :region_routes

  belongs_to :user, inverse_of: :routes

  validates :name, presence: true
  validates :description, presence: true
  validates :difficulty, presence: true
  validates :distance, presence: true
  validates :views_counter, numericality: { greater_than_or_equal_to: 0 }


  def add_view
    RouteAddViewJob.perform_later(self.id)
  end

end
