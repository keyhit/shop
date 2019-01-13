class CategoriesController < ApplicationController
  def index
    limit = 4
    if params[:offset].present?
      limit = params[:limit].to_i
      offset = params[:offset].to_i
    else
      offset = 0
    end

    # binding.pry
    @categories_count = Category.count
    @categories ||= Category.limit(limit).offset(offset)
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def categories_admin
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def new_product_category
    @categories = Category.all
  end

  def create
    if Category.create(categories_params)
      redirect_to categories_admin_path, notice: 'Category has been created!'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category ||= Category.find(params[:id])
    if @category.update(categories_params)
      redirect_to categories_admin_path, notice: 'Category has been udated!'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to categories_admin_path, notice: 'Category has been destroyed!'
    end
  end

  private

  def categories_params
    params.require(:category).permit(:name)
  end
end
