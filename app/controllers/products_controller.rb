class ProductsController < ApplicationController
  def products_by
    @categories ||= Category.all
    if params[:commit] =='Show'
      unless params[:price_range] == 'Select range' && params[:category] == "Select category"
        range = params[:price_range].gsub(/ - /, ' ').split(' ')
        @products_by = Product.where('price BETWEEN ? AND ? AND category_id  = ?', range[0], range[1], params[:category])
        @products_count = @products_by.count
      end

      if params[:category] == 'Select category' && params[:price_range] != 'Select range'
        range = params[:price_range].gsub(/ - /, ' ').split(' ')
        @products_by = Product.where('price BETWEEN ? AND ?', range[0], range[1])
        @products_count = @products_by.count
        @range = 'range_selector'
      end

      if params[:price_range] == 'Select range' && params[:category] != 'Select category'
        @products_by = Category.find(params[:category]).products
        @products_count = @products_by.count
        @cat = 'category_selector'
      end
    end

# binding.pry
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
