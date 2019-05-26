require 'rails_helper'

RSpec.describe Town, type: :model do
  let(:provinciavarese) { build_stubbed(:county) }
  subject { described_class.new(name: 'Varese', county: provinciavarese, latitude: 45, longitude: 0) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid    
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end


  it { should belong_to :county }
end
