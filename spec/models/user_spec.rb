require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(username: "lrnzgll", email: "user@user.com", password: "password") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid    
  end

  it "is not valid without a username" do
    subject.username = nil
    expect(subject).to_not be_valid
  end  

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  describe "#destroy" do
    it { expect(subject).to have_many(:routes).dependent(:destroy) }
    it { expect(subject).to have_one(:address).dependent(:destroy) }
  end
end
