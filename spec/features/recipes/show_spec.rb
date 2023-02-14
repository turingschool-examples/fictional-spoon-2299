require 'rails_helper'

# User Story 2

# As a visitor,
# When I visit '/recipes/:id',
# Then I see the recipe's name, complexity and genre,
# and I see a list of the names of the ingredients for the recipe.


RSpec.describe '/recipes/:id' do
  let!(:ingredient1) { Ingredient.create!(name: "Ground Beef", cost: 2) }
  let!(:recipe1) { Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian") }

  describe 'As a visitor' do
    describe 'When I visit /recipes/:id' do
      describe 'Then I see the recipes name, complexity and genre' do
        it 'and I see a list of the names of the ingredients for the recipe.' do
          visit "/recipes/#{recipe1.id}"
  
          expect(page).to have_content("Name: #{recipe1.name}")
          expect(page).to have_content("Complexity: #{recipe1.complexity}")
          expect(page).to have_content("Genre: #{recipe1.genre}")
        end
      end
    end
  end
end