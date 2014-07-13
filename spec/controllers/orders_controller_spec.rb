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
          expect(Order).to receive(:new).with({name: "sofia"}).and_call_original
          expect_any_instance_of(Order).to receive(:save).and_call_original
          post :create, user_id: kayla.id, format: :json, order: {name: "sofia"}
        end

        it 'return 201' do
          expect(response).to have_http_status(201)
        end

        it 'return location' do
          expect(response.header["Location"]).to match(%r{/users/#{kayla.id}/orders/\d+})
        end
      end
    end
  end
end
