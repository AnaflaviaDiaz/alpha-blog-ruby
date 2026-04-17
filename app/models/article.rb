class Article < ApplicationRecord
  # esto es para validar que el titulo no este vacio
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
