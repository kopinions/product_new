require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  render_views
  fixtures(:all)

  describe "GET Index" do
    context "product exist" do

      before(:each) {
        expect(Product).to receive(:all).and_return(products(:apple))
        get :index, format: :json
        @json = JSON.parse(response.body)
      }

      it 'return 200' do
        expect(response).to have_http_status(200)
      end

      it 'have one product' do
        expect(@json.length).to eq(1)
      end

      it 'product have name' do
        expect(@json[0]['name']).to eq("apple")
      end

      it 'product have description' do
        expect(@json[0]['description']).to eq(products(:apple).description)
      end

      it 'product have uri' do
        expect(@json[0]['uri']).to end_with("/products/#{products(:apple).id}")
      end
    end
  end

  describe "GET" do
    context "product exist" do

      before {
        get :show, id: 100
      }

      it 'return ok' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
