require 'csv'

class AssignCoordinates

  def initialize(name = nil, country = nil, region = nil)
    @name = name
    @country = country
    @region = region
    @file = Rails.root.join('app', 'services', 'coordinates.csv')
  end

  def start
    CSV.open( @file, 'wb' ) do |writer|
      Town.where('id > ?', 7478).includes(:county).order(:id).find_each do |town|
        sleep 0.1
        results = Geocoder.search("#{town.name}, provincia di #{town.county.name}, Italy")
        writer << [town.id, town.name, town.county.name, results.first.coordinates[0], results.first.coordinates[1]]
        p town.id
        writer
      end
    end
  end
end
