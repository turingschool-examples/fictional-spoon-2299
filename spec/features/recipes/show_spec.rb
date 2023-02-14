require 'rails_helper'

RSpec.describe '/recipes/:id' do
  let!(:ingredient1) { Ingredient.create!(name: "Ground Beef", cost: 2) }
  let!(:ingredient2) { Ingredient.create!(name: "Salt", cost: 4) }
  let!(:recipe1) { Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian") }
  let!(:recipe_ingredient) { recipe1.ingredients.create!(name: "Ground Beef", cost: 2) }

  # User Story 2

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

  # User Story 3

  describe 'As a visitor' do
    describe 'When I visit /recipes/:id' do
      it 'I see the total cost of all of the ingredients in the recipe.' do
        visit "/recipes/#{recipe1.id}"

        expect(page).to have_content("Total Cost: #{recipe1.ingredients.total_cost}")
      end
    end
  end
end