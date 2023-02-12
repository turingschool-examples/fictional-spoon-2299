class RecipeIngredientsController < ApplicationController
	def create
		RecipeIngredient.create!(recipe_id: params[:recipe_id], ingredient_id: params[:ingredient_id])
		redirect_to "/recipes/#{params[:recipe_id]}"
	end
end
