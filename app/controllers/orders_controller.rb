class OrdersController < ApplicationController
  before_action :get_user

  def index
    head 200
  end

  def create
    order_create = Order.new(order_params)
    @user.orders << order_create
    response.location = user_order_path @user, order_create
    head 201
  end

  def get_user
    @user = User.find(params[:user_id].to_i)
  end
  def order_params
    params.require(:order).permit(:name)
  end
end
