class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(params_article)
    redirect_to article_path(@article)
  end

  private

  def params_article
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
