FactoryBot.define do
  factory :county do
    name { (0...8).map { (65 + rand(26)).chr }.join }
    slug { "MyString" }
    region
  end
end
