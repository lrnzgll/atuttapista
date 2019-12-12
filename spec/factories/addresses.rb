FactoryBot.define do
  factory :address do
    region
    county
    town
    address1 { Faker::Address.street_address }
    postal_code { Faker::Address.zip_code }
    lonlat { RGeo::Cartesian.factory(srid: 4326).point(5, 45) }
  end
end
