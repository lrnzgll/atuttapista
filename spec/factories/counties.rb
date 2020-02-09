FactoryBot.define do
  factory :county do
    name { (0...8).map { rand(65..90).chr }.join }
    slug { "MyString" }
    region
  end
end
