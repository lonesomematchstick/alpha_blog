class CategoriesController < ApplicationController
  before_action :fetch_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @article_categories = @category.articles
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was successfully created."
      # redirect_to @category
      redirect_to categories_path
    else
      flash[:alert] = "Category was not created."
      render 'new'
    end
  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:notice] = "The category was successfully updated!"
      redirect_to @category
    else
      flash[:alert] = "Uh oh! The category was not updated!"
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  def fetch_category
    @category = Category.find(params[:id])
  end
end