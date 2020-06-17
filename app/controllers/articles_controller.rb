class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "The article was successfully created!"
      redirect_to @article
    else
      flash[:alert] = "Uh oh! The article was not created!"
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

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
    @article = Article.find(params[:id])
    @article.destroy
    flash[:alert] = "The article was destroyed."
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(
        :title,
        :description
      )
    end
end