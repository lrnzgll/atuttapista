require 'rails_helper'

RSpec.describe Surface, type: :model do
  let(:girolagovarese) { create(:route) }
  subject { described_class.new(name: 'misto', route: girolagovarese) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid    
  end

  it "is valid is name is in included name" do
    expect(subject).to validate_inclusion_of(:name).in_array(['asfalto', 'misto', 'ghiaia', 'terra'])
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end 

  it { should validate_uniqueness_of(:name).scoped_to(:route_id)}
  
  it { should belong_to :route }
end
