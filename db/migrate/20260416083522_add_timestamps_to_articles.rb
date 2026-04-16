class AddTimestampsToArticles < ActiveRecord::Migration[8.1]
  def change
    # add_column => nombre del metodo
    # :articles => nombre de la tabla
    # :created_at => nombre de la columna
    # :datetime => tipo de dato
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
