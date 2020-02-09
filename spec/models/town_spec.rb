require 'rails_helper'

RSpec.describe Town, type: :model do
  let(:provinciavarese) { build_stubbed(:county) }
  let(:lombardia) { build_stubbed(:region) }
  let(:lonlat) { RGeo::Cartesian.factory(srid: 4326).point(5, 45) }
  subject { described_class.new(name: 'Varese', county: provinciavarese, region: lombardia, lonlat: lonlat) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it { should belong_to :county }
end
