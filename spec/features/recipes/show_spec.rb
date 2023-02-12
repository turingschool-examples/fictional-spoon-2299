require 'rails_helper'

RSpec.describe 'Recipes Show Page', type: :feature do
  describe 'As a visitor' do
		let!(:flour) { Ingredient.create!(name: 'Flour', cost: 2) }
		let!(:eggs) { Ingredient.create!(name: 'Eggs', cost: 6) }
		let!(:butter) { Ingredient.create!(name: 'Butter', cost: 3) }
		
		let!(:biscuits) { Recipe.create!(name: 'Biscuits', complexity: 1, genre: 'Bread') }
\
		let!(:biscuits_ingredients_1) { RecipeIngredient.create!(recipe: biscuits, ingredient: flour)}
		let!(:biscuits_ingredients_2) { RecipeIngredient.create!(recipe: biscuits, ingredient: eggs)}
		let!(:biscuits_ingredients_3) { RecipeIngredient.create!(recipe: biscuits, ingredient: butter)}

		it 'I see recipe name, complexity and genre' do
			visit "/recipes/#{biscuits.id}"
			
			expect(page).to have_content(biscuits.name)
			expect(page).to have_content("Complexity: #{biscuits.complexity}")
			expect(page).to have_content("Genre: #{biscuits.genre}")
			expect(page).to have_content(flour.name)
			expect(page).to have_content(eggs.name)
			expect(page).to have_content(butter.name)
		end

		it 'I see the total cost of the ingredients for recipe' do
			visit "/recipes/#{biscuits.id}"

			total_cost = biscuits.ingredients.sum(:cost)
			expect(page).to have_content("Total Cost: #{total_cost}")
		end

		it 'I see a form to add an ingredient to the recipe' do
			visit "/recipes/#{biscuits.id}"
			
			expect(page).to have_field(:name)
			expect(page).to have_field(:cost)
			expect(page).to have_button('Add Ingredient')
		end
	end
end
