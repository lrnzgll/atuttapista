FactoryBot.define do
  factory :address_location do
    address1 { "MyString" }
    address2 { "MyString" }
    postal_code { "MyString" }
    lnglat { "" }
    town { nil }
  end
end
