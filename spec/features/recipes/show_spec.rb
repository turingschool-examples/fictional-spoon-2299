require 'rails_helper'

RSpec.describe RecipesController, type: :feature do
  let!(:cilantro) { Ingredient.create!(name: "Cilantro", cost: 1) }
  let!(:onion) { Ingredient.create!(name: "Onion", cost: 2) }
  let!(:olives) { Ingredient.create!(name: "Olives", cost: 3) }
  let!(:spaghetti) { Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian") }
  let!(:pizza) { Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian") }
  let!(:garden_salad) { Recipe.create!(name: "Garden Salad", complexity: 2, genre: "Greek") }

  describe 'As a visitor,' do
    context "when I visit '/recipes/:id'," do
      it "I see the recipe's name, complexity and genre" do
        visit "/recipes/#{pizza.id}"

        save_and_open_page

        expect(page).to have_content("Recipe:")
        expect(page).to have_content("Name: #{pizza.name}")
        expect(page).to have_content("Complexity: #{pizza.complexity}")
        expect(page).to have_content("Genre: #{pizza.genre}")
      end
    end
  end
end