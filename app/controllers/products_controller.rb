class ProductsController < ApplicationController
  before_action :get_product, only: [:show]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  def index
    @products = Product.all()
  end

  def show
  end

  private
    def get_product
      @product = Product.find(params['id'].to_i)
    end

    def not_found
      response.status = 404
    end
end
