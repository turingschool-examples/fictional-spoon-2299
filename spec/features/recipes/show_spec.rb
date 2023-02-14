require 'rails_helper'

RSpec.describe 'recipes/show', type: :feature do
  let!(:pasta) { Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian") }
  let!(:noodles) { Ingredient.create!(name: "Noodles", cost: 2) }
  let!(:tomato_sauce) { Ingredient.create!(name: "Tomato Sauce", cost: 1) }
  let!(:pasta_ingred1) { RecipeIngredient.create!(recipe: pasta, ingredient: noodles) }
  let!(:pasta_ingred2) { RecipeIngredient.create!(recipe: pasta, ingredient: tomato_sauce) }
  describe 'User Story 2' do
    it 'returns the recipe name, complexity, and genre and a list of ingredient names' do

      visit "/recipes/#{pasta.id}"
      
      expect(page).to have_content("#{pasta.name}")
      expect(page).to have_content("#{pasta.complexity}")
      expect(page).to have_content("#{pasta.genre}")
      expect(page).to have_content("#{noodles.name}")
      expect(page).to have_content("#{tomato_sauce.name}")
    end
  end

  describe 'User Story 3' do
    it 'displays the total cost of all ingredients in the recipe' do
      visit "/recipes/#{pasta.id}"

      expect(page).to have_content("Total Cost: #{pasta.total_cost}")
    end
  end
end