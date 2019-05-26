require 'rails_helper'

RSpec.describe RegionRoute, type: :model do
  let(:lombardia) { build_stubbed(:region) }
  let(:girolagovarese) {build_stubbed(:route) }
  subject { described_class.new(region: lombardia, route: girolagovarese) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid    
  end

  it "is not valid without a region" do
    subject.region = nil
    expect(subject).to_not be_valid
  end  
  
  it "is not valid without a route" do
    subject.route = nil
    expect(subject).to_not be_valid
  end
  it { should belong_to :route }
  it { should belong_to :region }
end
