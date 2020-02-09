require 'rails_helper'

RSpec.describe PlaceOfInterest, type: :model do
  let(:tigros) { build_stubbed(:place_of_interest) }

  it 'is valid with valid attributes' do
    expect(tigros).to be_valid
  end

  it "is not valid without a name" do
    tigros.name = nil
    expect(tigros).to_not be_valid
  end

  it "is not valid without a description" do
    tigros.description = nil
    expect(tigros).to_not be_valid
  end

  describe "#destroy" do
    it { expect(subject).to have_many(:addresses).dependent(:destroy) }
  end

  it { should belong_to :county }
end
