require 'rails_helper'

RSpec.describe Dashboard::DashboardFacade do
  let(:user) { create(:user) }
  let!(:route1) { create(:route, user: user) }

  describe '#user' do
    subject { Dashboard::DashboardFacade.new(user) }
    context 'when called' do
      it 'return user' do
        expect(subject.user).to be(user)
      end
    end
  end
  describe '#routes_count' do
    subject { Dashboard::DashboardFacade.new(user) }
    context 'when called' do
      it 'return user\'s routes count ' do
        expect(subject.routes_count).to eq(1)
      end
    end
  end
end
