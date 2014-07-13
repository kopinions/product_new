require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  fixtures(:all)

  describe 'GET' do
    context 'user exist' do
      before(:each) do
        expect(User).to receive(:find).with(33).and_return(users(:kayla))
        get :show, id: 33, format: :json
      end

      it 'return 200' do

        expect(response).to have_http_status(200)
      end
    end

    context 'user not exist' do
      before(:each) do
        expect(User).to receive(:find).with(100).and_raise(ActiveRecord::RecordNotFound)
        get :show, id: 100, format: :json
      end

      it 'return 404' do

        expect(response).to have_http_status(404)
      end
    end

  end
end
