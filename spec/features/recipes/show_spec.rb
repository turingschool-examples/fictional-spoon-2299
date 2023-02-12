require 'rails_helper'

RSpec.describe 'Recipes Show Page', type: :feature do
  describe 'As a visitor' do
		let!(:flour) { Ingredient.create!(name: 'Flour', cost: 2) }
		let!(:eggs) { Ingredient.create!(name: 'Eggs', cost: 6) }
		let!(:butter) { Ingredient.create!(name: 'Butter', cost: 3) }
		
		let!(:biscuits) { Recipe.create!(name: 'Biscuits', complexity: 'easy', genre: 'Bread') }
		let!(:cookies) { Recipe.create!(name: 'Sugar Cookies', complexity: 'easy', genre: 'dessert') }

		let!(:biscuits_ingredients_1) { RecipeIngredient.create!(recipe: biscuits, ingredient: flour)}
		let!(:biscuits_ingredients_2) { RecipeIngredient.create!(recipe: biscuits, ingredient: eggs)}
		let!(:biscuits_ingredients_3) { RecipeIngredient.create!(recipe: biscuits, ingredient: butter)}
		let!(:cookies_ingredients_1) { RecipeIngredient.create!(recipe: cookies, ingredient: flour)}
		let!(:cookies_ingredients_2) { RecipeIngredient.create!(recipe: cookies, ingredient: eggs)}
		let!(:cookies_ingredients_3) { RecipeIngredient.create!(recipe: cookies, ingredient: butter)}
		
		it 'I see recipe name, complexity and genre' do
			visit "/recipes/#{biscuits.id}"
			
			expect(page).to have_content(flour.name)
			expect(page).to have_content(flour.cost)
			expect(page).to have_content(eggs.name)
			expect(page).to have_content(eggs.cost)
			expect(page).to have_content(butter.name)
			expect(page).to have_content(butter.cost)
		end
	end
end
