require 'rails_helper'

RSpec.describe View::ViewService do
  describe "#add_views" do
    let(:route) {create(:route)}
    subject {described_class.new(route.id)}

      context 'when called' do
        it "add 1 to the route visit_counter field" do
          expect(route.views_counter).to eq(0)
          subject.add_views
          expect(route.reload.views_counter).to eq(1)
        end
      end

  end
end