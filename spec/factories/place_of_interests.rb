FactoryBot.define do
  factory :place_of_interest do
    name { "Tigros" }
    description { "0" * 999_999 }
    county
  end
end
