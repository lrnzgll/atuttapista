require 'rails_helper'

RSpec.describe Dashboard::DashboardFacade do
  let(:user) { create(:user) }
  let(:ip) { '46.165.226.9' }
  let!(:route1) { create(:route, user: user) }

  describe '#user' do
    subject { Dashboard::DashboardFacade.new(user, ip) }
    context 'when called' do
      it 'return user' do
        expect(subject.user).to be(user)
      end
    end
  end
  describe '#routes_count' do
    subject { Dashboard::DashboardFacade.new(user, ip) }
    context 'when called' do
      it 'return user\'s routes count ' do
        expect(subject.routes_count).to eq(1)
      end
    end
  end
  describe '#user_coordinates' do
    subject { Dashboard::DashboardFacade.new(user, ip) }
    context 'when the user has not address' do
      it 'returns an hash with data from Geocoder' do
        expect(subject.user_coordinates).to eq(lng: 8, lat: 50)
      end
    end
    context 'when the user has an address' do
      let!(:address) { create(:address, addressable: user) }
      it 'returns an hash with data from the address' do
        expect(subject.user_coordinates).to eq(lng: 5, lat: 45)
      end
    end
  end
end
