require 'faker'
require 'betterlorem'
require 'csv'



Region.destroy_all
Country.destroy_all
County.destroy_all
Town.destroy_all
User.destroy_all
Route.destroy_all
Kind.destroy_all
Surface.destroy_all
RegionRoute.destroy_all
RouteLocation.destroy_all
Address.destroy_all






# frozen_string_literal: true

class UpdateDatabase

  def initialize
  end
  
  def call
      create_users
      create_countries
      create_regions
      create_counties
      create_towns
      # create_place_of_interest
      create_routes
      create_addresses
  end

  private

  def create_countries
    p 'creating countries'
    Country.create(name: "Italia", slug:"IT")
  end

  def create_regions
    p 'creating regions'
    regions = []
    country = Country.last
    Dir.glob('db/comuni/data/*.json') do |e|
      t = JSON.parse(File.read(e))
      next if regions.any?{|c| c.name == t['regione']['nome'] }

      regions << country.regions.new(name: t['regione']['nome'], slug: t['regione']['nome'].parameterize(separator: ''))
    end
    Region.import regions
    p 'regions created'
  end

  def create_counties
    p 'creating counties'
    counties = []
    Dir.glob('db/comuni/data/*.json') do |e|
      t = JSON.parse(File.read(e))
      next if counties.any?{|c| c.name == t['provincia']['nome'] }

      region = Region.find_by(name: t['regione']['nome'])
      p region.name
      counties << region.counties.new(name: t['provincia']['nome'], slug: t['sigla'])
    end
    County.import counties, validate: true
    p 'counties created'
  end

  def create_addresses
    addresses = []
    User.find_each do |user|
      addresses << Address.new(addressable: user, address1: 'Via Rio Trecxxa', postal_code: '21443', region: Town.last.region, county: Town.last.county, town: Town.last, lonlat: Town.last.lonlat )
    end
    Address.import addresses, validate: true
    p 'addresses created'
  end

  def create_towns
    p 'creating towns'
    towns = []
    r = Roo::Spreadsheet.open('db/comuni/Comuni.xls').sheet('Comuni').map{|row| row}

    Dir.glob('db/comuni/data/*.json') do |e|
      t = JSON.parse(File.read(e))
      next if towns.any?{|t| t.name == t['nome'] }

      county = County.find_by(name: t['provincia']['nome'])
      ll = r.select{|e| e[14] == t['nome']}
      p t['nome']
      towns << county.towns.new(name: t['nome'], population: t['popolazione'], region: county.region, lonlat: lats(ll.flatten))
    end
    Town.import towns, validate: true
    p 'towns created'
  end

  def lats(ll)
    return nil if ll.empty?

    lat_lon = "#{ll[3].to_i}° #{ll[4].to_i}' #{ll[5].to_i}'' #{ll[6].to_i}° #{ll[7].to_i}' #{ll[8].to_i}''".scan(/(\d+)° (\d+)' (\d+)''/).map do |d,m,s|
      d.to_f + m.to_f/60 + s.to_f/3600
    end

    RGeo::Cartesian.factory(:srid => 4326).point(lat_lon[1], lat_lon[0])
  end

  def create_place_of_interest
    p 'creating place of interests'
    pl_int = []
    Array.new(1000) do |e|
      pl_int << PlaceOfInterest.new(name: Faker::Name.name, description: BetterLorem.p(rand(3..20), true, true ), county_id: County.all.sample.id)
      p pl_int.name
    end
    PlaceOfInterest.import pl_int
    p 'place of interested created'
  end
  
  def create_users
    p 'creating users'
    users = []
    Array.new(50) do
      users << User.new(username: Faker::Name.name, email: "abc#{rand(99999)}@abc.com", password: 'password')
    end
    User.import users
    p 'users created'
  end

  def create_routes
    p 'creating routes'
    routes = []
    Array.new(500) do |i|
      r = Route.new(name: "#{Faker::Address.city} to #{Faker::Address.city}", description: BetterLorem.p(rand(3..20), true, true ), difficulty: rand(1..10), distance: rand(3..100), gpx: 'bla', user: User.all.sample)
      r.region_routes.build(route: r, region: Region.all.sample)
      r.county_routes.build(route: r, county: County.all.sample)
      r.route_locations.build(name: Faker::Name.name, description: BetterLorem.p(rand(3..20), true, true ), route_id: r.id)
      routes << r
    end
    Route.import routes, recursive: true
    p 'routes created'
    create_kinds_surfaces
  end

  def create_kinds_surfaces
    Route.find_each do |r|
      Array.new(rand(1..4)) do
        f = r.kinds.new(name: ["strada", "sentiero", "ciclopedonale", "ciclabile"].sample,  route_id: r.id)
        f.save if f.valid?
      end
      Array.new(rand(1..4)) do
        m = r.surfaces.new(name: ["asfalto", "misto", "ghiaia", "terra"].sample, route_id: r.id)
        m.save if m.valid?
      end
    end
  end
end


UpdateDatabase.new.call

