class ArticlesController < ApplicationController
  # se ejecutará antes de las acciones show, edit, update y destroy para establecer el artículo correspondiente
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]

  def show
  end

  # para listar todos los artículos
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created."
      redirect_to @article
    # cuando el formuario no es valido, se debe renderizar de nuevo el formulario
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      # mensaje para el banner de confirmacion que está en layout application.html.erb
      flash[:notice] = "Article was updated successfully."
      # redirige a la página del artículo actualizado
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    # redirige a la página de listado de artículos después de eliminar el artículo
    redirect_to articles_path
  end

  # método privado para manejar los parámetros permitidos
  private

  def set_article
    # params[:id] lo toma de la URL, por ejemplo: /articles/1, donde 1 es el id del artículo
    @article = Article.find(params[:id])
  end

  def article_params
    # params.require(:article) asegura que el parámetro :article esté presente y luego permite solo los atributos title y description
    params.require(:article).permit(:title, :description)
  end
end
