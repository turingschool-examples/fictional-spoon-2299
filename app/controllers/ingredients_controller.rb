class IngredientsController < ApplicationController
	def index
		@ingredients = Ingredient.sort_by_name
	end
end
