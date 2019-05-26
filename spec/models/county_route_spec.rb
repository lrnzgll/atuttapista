require 'rails_helper'

RSpec.describe CountyRoute, type: :model do
  it { should belong_to :route }
  it { should belong_to :county }
end
