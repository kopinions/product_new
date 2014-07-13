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
        expect(Product).to receive(:find).with(100).and_return(products(:apple))
        get :show, id: 100, format: :json
      }

      it 'return ok' do
        expect(response).to have_http_status(200)
      end

      it 'return product name' do
        expect(json["name"]).to eq(products(:apple).name)
      end

      it 'return product description' do
        expect(json["description"]).to eq(products(:apple).description)
      end

      it 'return product description' do
        expect(json["uri"]).to end_with("/products/#{products(:apple).id}")
      end
    end

    context "product not exist" do
      before {
        expect(Product).to receive(:find).with(1).and_raise(ActiveRecord::RecordNotFound)
        get :show, id: 1, format: :json
      }

      it 'return not found' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST' do
    context 'create product' do
      let! (:banana) {Product.create({name: 'banana', description: 'yellow banana'})}
      before(:each) {
        expect(Product).to receive(:create).with({name: 'banana', description: 'yellow banana'}).and_return(banana)
        expect_any_instance_of(Price).to receive(:save).and_call_original
        post :create, format: :json, product: {name: 'banana', description: 'yellow banana', price: {amount: 100}}
      }

      it 'return 201' do
        expect(response).to have_http_status(201)
      end

      it 'return uri of create product' do
        expect(response.header['Location']).to end_with("/products/#{banana.id}")
      end
    end
  end
end
