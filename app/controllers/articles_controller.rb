class ArticlesController < ApplicationController
  def show
    # params[:id] lo toma de la URL, por ejemplo: /articles/1, donde 1 es el id del artículo
    @article = Article.find(params[:id])
  end

  # para listar todos los artículos
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    redirect_to @article
  end
end
