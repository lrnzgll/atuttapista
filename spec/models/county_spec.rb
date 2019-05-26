require 'rails_helper'

RSpec.describe County, type: :model do
  let(:lombardia) { build_stubbed(:region) }
  subject { described_class.new(name: "Varese", slug: "VA", region: lombardia) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a slug" do
    subject.slug = nil
    expect(subject).to_not be_valid
  end

  describe "#destroy" do
    it { expect(subject).to have_many(:county_routes).dependent(:destroy) }
    it { expect(subject).to have_many(:place_of_interests).dependent(:destroy) }
  end
  it { should belong_to :region }
end
