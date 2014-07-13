require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'GET' do
    context 'user exist' do
      before(:each) do
        get :show, id: 100, format: :json
      end

      it 'return 200' do

        expect(response).to have_http_status(200)
      end
    end
  end
end
