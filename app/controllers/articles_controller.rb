
class ArticlesController < ApplicationController
  def show
    # params[:id] lo toma de la URL, por ejemplo: /articles/1, donde 1 es el id del artículo
    @article = Article.find(params[:id])
  end
end
