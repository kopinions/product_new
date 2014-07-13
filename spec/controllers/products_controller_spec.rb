require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  render_views
  describe "GET" do
    context "product exist" do

      before(:each) {
        expect(Product).to receive(:all).and_return([Product.new])
        get :index, format: :json
        @json = JSON.parse(response.body)
      }

      it 'return 200' do
        expect(response).to have_http_status(200)
      end

      it 'have one product' do
        expect(@json.length).to eq(1)
      end
    end
  end
end
