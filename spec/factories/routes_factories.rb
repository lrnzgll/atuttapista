require 'faker'

FactoryBot.define do
  factory :route do
    name { "0" * 99 }
    description { "0" * 99 }
    difficulty { rand(0..100)}
    distance { rand(0..300) }
    gpx { "MyString" }
    user
  end
end
