class ProductsController < ApplicationController
  def products_by
    @categories = Category.all

    if params[:keyword].present?
      @products_by = Product.where("id = ? OR title LIKE ? OR price LIKE ? OR short_description LIKE ? OR full_description LIKE ?", "#{params[:keyword]}", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
      @products_count = @products_by.count
    end

 # binding.pry


    if params[:commit].present?
      unless params[:price_range] == 'Select range' && params[:category] == 'Select category'
        range = params[:price_range].gsub(/ - /, ' ').split(' ')
        @products_by = Product.where(
          'price BETWEEN ? AND ? AND category_id  = ?',
          range[0],
          range[1],
          params[:category]
        )
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

  end

  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @product = @category.products.new
  end

  def create
    if Product.create(products_params)
      redirect_to products_by_path, notice: 'Product has been created!'
    else
      redirect_to new_category_product_path, notice: 'Product was not created!'
    end
  end
  
  def edit
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
  end

  def update
    # @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
    if @product.update(products_params)
      redirect_to category_product_path(@product.category_id, @product.id), notice: 'Product has been updated!'
    else
      redirect_to new_category_product_path, notice: 'Product was not updated!'
    end
  end

  def destroy
  end

  private

  def products_params
    params.require(:product).permit(
      :title,
      :price,
      :short_description,
      :full_description,
      :in_stock,
      :preview_image,
      :avatar,
      {avatars: []}
    ).merge(category_id: params[:category_id])
  end
end
