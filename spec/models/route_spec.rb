require 'rails_helper'

RSpec.describe Route, type: :model do
  let!(:girolagodivarese) {create(:route)}

  it "is valid with valid attributes" do
    expect(girolagodivarese).to be_valid    
  end

  it "is not valid without a name" do
    girolagodivarese.name = nil
    expect(girolagodivarese).to_not be_valid
  end
  
  it "is not valid without a distance" do
    girolagodivarese.distance = nil
    expect(girolagodivarese).to_not be_valid
  end 

  it "is not valid without a description" do
    girolagodivarese.description = nil
    expect(girolagodivarese).to_not be_valid
  end 

  it "is not valid without a difficulty" do
    girolagodivarese.difficulty = nil
    expect(girolagodivarese).to_not be_valid
  end 
  it "should have a default vote value of zero" do
    expect(girolagodivarese.views_counter).to eq(0)
  end
  describe "#destroy" do
    it { expect(girolagodivarese).to have_many(:region_routes).dependent(:destroy) }
    it { expect(girolagodivarese).to have_many(:route_locations).dependent(:destroy) }
    it { expect(girolagodivarese).to have_many(:kinds).dependent(:destroy) }
    it { expect(girolagodivarese).to have_many(:surfaces).dependent(:destroy) }
    
  end

  it { should belong_to :user }
end
