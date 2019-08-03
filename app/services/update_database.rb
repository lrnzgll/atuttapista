# frozen_string_literal: true

class UpdateDatabase
  attr_reader :csv

  def initialize
    @csv = CSV.read("lib/assets/comuni-it.csv", headers: true, encoding: "ISO8859-3")
  end
  
  def call
    create_countries
    create_regions
    create_counties
    create_towns
    create_place_of_interest
    create_users
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
    regioni = [["Abruzzo", "abruzzo"], ["Basilicata", "basilicata"], ["Calabria", "calabria"], ["Campania", "campania"], ["Emilia-Romangna", "emiliaromagna"], 
    ["Friuli-Venezia Giulia", "friuliveneziagiulia"], ["Lazio", "lazio"], ["Liguria", "liguria"], ["Lombardia", "lombardia"], ["Marche", "marche"], ["Molise", "molise"], ["Piemonte", "piemonte"], ["Puglia", "puglia"], ["Sardegna", "sardegna"], ["Sicilia", "sicilia"], ["Toscana", "toscana"], ["Trentino-Alto Adige/Südtirol", "trentinoaltoadige"], ["Umbria", "umbria"], ["Valle d'Aosta", "valledaosta"], ["Veneto", "veneto"]]

    rr = []
    regioni.each do |regione|
      rr << Region.new(name: regione[0], slug: regione[1], country: Country.last)
    end
    Region.import rr
    p 'regions created'
  end

  def create_counties
    p 'creating counties'
    counties = []
    @csv.each do |row|
      hash = row.to_h
      next if counties.any?{ |c| c.name == hash['provincia']}

      region = Region.find_by(name: hash['regione'])
      next if region.nil?

      p hash['provincia']
      counties << County.new(name: hash['provincia'], slug: hash['automobilistica'], region: region)
    end
    County.import counties, validate: true
    County.create(name:"Valle d'Aosta/Vallée d'Aoste", slug: 'AO', region: Region.find_by(slug: 'valledaosta'))
    p 'counties created'
  end

  def create_towns
    p 'creating towns'
    towns = []
    @csv.each do |row|
      hash = row.to_h
      next if Town.where(name: hash['nome']).exists?

      county = County.find_by(name: hash['provincia'])
      p hash['nome']
      raise 'no county' if county.nil?
      towns << Town.new(name: hash['nome'], slug:"#{hash['nome']}_#{hash['automobilistica']}", zone: hash['zona'], capoluogo: hash['capoluogo'] == '0' ? false : true, region_name: hash['regione'], plate_slug: hash['automobilistica'], population: hash['popolazione'].to_i, county: county)
    end
    Town.import towns, validate: true
    p 'towns created'
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
      users << User.new(username: Faker::Name.name, email: "abc#{rand(999)}@abc.com", password: 'password')
    end
    User.import users
    p 'users created'
  end

  def create_routes
    p 'creating routes'
    routes = []
    Array.new(2000) do |i|
      r = Route.new(name: "#{Faker::Address.city} to #{Faker::Address.city}", description: BetterLorem.p(rand(3..20), true, true ), difficulty: rand(1..10), distance: rand(3..100), gpx: 'bla', user: User.all.sample)
      r.region_routes.build(route: r, region: Region.all.sample)
      r.county_routes.build(route: r, county: County.all.sample)
      r.route_locations.build(name: Faker::Name.name, description: BetterLorem.p(rand(3..20), true, true ), route_id: r.id)
      Array.new(rand(1..4)) do
        r.kinds.build(name: ["strada", "sentiero", "ciclopedonale", "ciclabile"].sample,  route_id: r.id)
      end
      Array.new(rand(1..4)) do
        r.surfaces.build(name: ["asfalto", "misto", "ghiaia", "terra"].sample, route_id: r.id)
      end
      routes << r
    end
    Route.import routes, recursive: true
    p 'routes created'
  end

  def create_addresses
    AddressLocation.create(address1: 'Via Rio Cocchino,5', postal_code: '21040', town: 'Caronno Varesino')
  end
end
