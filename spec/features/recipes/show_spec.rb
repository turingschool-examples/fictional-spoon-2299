require 'rails_helper'

RSpec.describe RecipesController, type: :feature do
  let(:onion) { Ingredient.create!(name: "Onion", cost: 2) }
  let(:olives) { Ingredient.create!(name: "Olives", cost: 3) }
  let(:pizza) { Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian") }

  before do
    RecipeIngredient.create!(recipe_id: pizza.id, ingredient_id: onion.id)
    RecipeIngredient.create!(recipe_id: pizza.id, ingredient_id: olives.id)
  end
  describe 'As a visitor,' do
    context "when I visit '/recipes/:id'," do
      it "I see the recipe's name, complexity and genre" do
        visit "/recipes/#{pizza.id}"

        expect(page).to have_content("Recipe")
        expect(page).to have_content("#{pizza.name}:")
        expect(page).to have_content("Complexity: #{pizza.complexity}")
        expect(page).to have_content("Genre: #{pizza.genre}")
      end

      it "I see a list of the names of the ingredients for the recipe" do
        visit "/recipes/#{pizza.id}"

        expect(page).to have_content("Recipe Ingredients:")
        expect(page).to have_content(pizza.ingredients.first.name)
        expect(page).to have_content(pizza.ingredients.second.name)
      end
      
      it "I see the total cost of all of the ingredients in the recipe" do
        visit "/recipes/#{pizza.id}"
        
        expect(page).to have_content("Total Cost for Ingredients: #{@total_cost}")
      end
    end
  end
end