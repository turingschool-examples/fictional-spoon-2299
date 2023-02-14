class RecipesController < ApplicationController

  def show
		@recipe = Recipe.find(params[:id])
		@ingredients = @recipe.ingredients
  end

	def update
		@recipe = Recipe.find(params[:id])
  	@ingredient = Ingredient.find_by_id(params[:ingredient])
  		if @ingredient
    		@recipe.ingredients << @ingredient
    		@recipe.save
  		else
    		flash[:error] = 'Ingredient not found'
  		end
			redirect_to "/recipes/#{@recipe.id}"
	end
	

private
	def recipe_params
		params.permit(:name, :complexity, :genre, :ingredients)
	end
end