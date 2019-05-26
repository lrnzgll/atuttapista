  require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:italy) { build_stubbed(:country) }
  subject { described_class.new(name: "Lombardia", slug: "LO", country: italy) }

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
    it { expect(subject).to have_many(:counties).dependent(:destroy) }
    it { expect(subject).to have_many(:region_routes).dependent(:destroy) }
  end
  it { should belong_to :country }
end
