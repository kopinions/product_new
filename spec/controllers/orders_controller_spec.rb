require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  fixtures(:all)

  describe 'GET index' do
    context 'user kayla' do
      let! (:kayla) {users(:kayla)}
      context 'with one order' do
        before(:each) do
          get :index, user_id: kayla.id, format: :json
        end
        it 'return 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
  end

  describe 'POST' do
    context 'user kayla' do
      let! (:kayla) {users(:kayla)}

      context 'create order' do
        before(:each) do
          post :create, user_id: kayla.id, format: :json
        end

        it 'return 201' do
          expect(response).to have_http_status(201)
        end
      end
    end
  end
end
