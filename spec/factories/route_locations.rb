FactoryBot.define do
  factory :route_location do
    name { "Schiranna" }
    description { "0" * 999_999 }
    route
  end
end
