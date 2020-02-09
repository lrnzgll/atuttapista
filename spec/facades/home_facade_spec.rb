require 'rails_helper'

RSpec.describe Home::HomeFacade do
  let!(:region1) { create(:region) }
  let!(:region2) { create(:region) }
  let!(:region3) { create(:region) }
  let!(:region4) { create(:region) }
  let!(:route1) { create(:route, cached_votes_total: 5) }
  let!(:route2) { create(:route, cached_votes_total: 30) }
  let!(:route3) { create(:route, cached_votes_total: 20) }
  let!(:route4) { create(:route, cached_votes_total: 20) }

  describe '#routes_by_region' do
    context 'when called' do
      it 'returns all the routes in the region ordered by name' do
        rr = subject.routes_by_region
        rr.pluck(:name)
        expect(rr.pluck(:name).each_cons(2).all? { |a, b| a <= b }).to be_truthy
      end
    end
  end

  describe '#selected_regions' do
    context 'when called' do
      xit 'returns all the regions with at least a route' do
      end
      xit 'returns the regions ordered by the number of routes' do
      end
    end
  end

  describe '#featured_routes' do
    context 'when called' do
      xit 'returns the routes with the most votes' do
      end
    end
  end
end
