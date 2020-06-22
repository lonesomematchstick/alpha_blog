class ArticlesController < ApplicationController
  before_action :fetch_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.find(User.pluck(:id).sample)

    if @article.save
      flash[:notice] = "The article was successfully created!"
      redirect_to @article
    else
      flash[:alert] = "Uh oh! The article was not created!"
      render 'new'
    end
  end

  def edit
  end

  def update
    @article.update(article_params)
    if @article.save
      flash[:notice] = "The article was successfully updated!"
      redirect_to @article
    else
      flash[:alert] = "Uh oh! The article was not updated!"
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:alert] = "The article was destroyed."
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(
      :user,
      :title,
      :description
    )
  end

  def fetch_article
    @article = Article.find(params[:id])
  end
  
end