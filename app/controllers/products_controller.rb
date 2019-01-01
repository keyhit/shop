class ProductsController < ApplicationController
  def products_by_category
    @categories ||= Category.all
    if params[:commit] == 'Show'
      @products_by_category ||= Category.find_by(name: params[:name]).products
      respond_to do |format|
        format.html { render "products_by_category"}
      end
    end
  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def updare
  end

  def destroy
  end

  def _form
  end
end
