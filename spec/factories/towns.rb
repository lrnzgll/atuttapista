FactoryBot.define do
  factory :town do
    county
    region
    name { "MyString" }
    lonlat { RGeo::Cartesian.factory(srid: 4326).point(45, 5) }
  end
end
