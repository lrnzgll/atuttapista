require 'rails_helper'

RSpec.describe Address, type: :model do

  it { should belong_to :address_location }
  it { should belong_to :addressable }
end
