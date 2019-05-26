require 'rails_helper'


RSpec.describe Country, type: :model do
  subject { described_class.new(name: "Italia", slug: "IT") }


  it "is valid with valid attributes" do
    expect(subject).to be_valid    
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end  
  
  it "is not valid without a slug " do
    subject.slug = nil
    expect(subject).to_not be_valid
  end

  describe "#destroy" do
    it { expect(subject).to have_many(:regions).dependent(:destroy) }
  end
end
