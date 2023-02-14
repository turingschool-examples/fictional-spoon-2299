class Ingredient < ApplicationRecord
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
	scope :sort_alphabetically, -> { order(:name) }	
end