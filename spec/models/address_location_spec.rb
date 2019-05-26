require 'rails_helper'

RSpec.describe AddressLocation, type: :model do
  let(:varese){ build_stubbed(:town) }
  subject { described_class.new(town: varese, address1: "Via Milano, 2", postal_code: '22030') }


  it "is valid with valid attributes" do
    expect(subject).to be_valid    
  end

  it "is not valid without an address" do
    subject.address1 = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a postal code" do
    subject.postal_code = nil
    expect(subject).to_not be_valid
  end 

  describe "#destroy" do
    it { expect(subject).to have_many(:addresses).dependent(:destroy) }
  end

  it { should belong_to :town }
end
