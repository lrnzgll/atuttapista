require 'faker'

FactoryBot.define do
    factory :region do
      name { Faker::Address.state }
      slug  { Faker::Address.country_code }
      country
    end
  end