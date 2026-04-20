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
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to @article
    # cuando el formuario no es valido, se debe renderizar de nuevo el formulario
    else
      render :new
    end
  end
end
