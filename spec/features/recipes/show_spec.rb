require 'rails_helper'

RSpec.describe 'recipe show page' do
  describe "when I visit /recipes/:id" do
    it 'Shows a recipies name, complexity, genre, and ingredients' do
      recipe_1 = Recipe.create!(name: ' Strip Steak', complexity: 1, genre: 'American?')
      ingredient_1 = Ingredient.create!(name: 'salt', cost: 12)
      ingredient_2 = Ingredient.create!(name: 'pepper', cost: 14)
      ingredient_3 = Ingredient.create!(name: 'garlic', cost: 13)
      ingredient_4 = Ingredient.create!(name: 'New York Strip', cost: 25)

      visit "/recipes/#{recipe_1.id}"

      expect(page).to have_content()
    end 
  end 
end 