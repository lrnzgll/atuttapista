require 'rails_helper'

RSpec.describe RouteLocation, type: :model do
  let(:schiranna) { build_stubbed(:route_location) }

  it 'is valid with valid attributes' do
    expect(schiranna).to be_valid
  end

  it "is not valid without a name" do
    schiranna.name = nil
    expect(schiranna).to_not be_valid
  end

  it "is not valid without a description" do
    schiranna.description = nil
    expect(schiranna).to_not be_valid
  end

  describe "#destroy" do
    it { expect(subject).to have_many(:addresses).dependent(:destroy) }
  end

  it { should belong_to :route }
end
