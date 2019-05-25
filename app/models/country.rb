class Country < ApplicationRecord
  has_many :regions, dependent: :destroy
  
  validates :slug, presence: true
  validates :name, presence: true

  def u_regions_names
    self.regions.map{|x| x.name.upcase}
  end
  
end
    