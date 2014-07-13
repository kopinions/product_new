require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe "GET" do
    context "product exist" do
      before(:each) {
        get :index
      }

      it 'should return 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
