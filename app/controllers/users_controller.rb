class UsersController < ApplicationController
  before_action :get_user, only: [:show ]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def show
    head 200
  end

  private
  def get_user
    @user = User.find(params['id'].to_i)
  end

  def not_found
    response.status = 404
  end
end
