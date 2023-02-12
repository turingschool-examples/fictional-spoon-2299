require 'rails_helper'

RSpec.describe 'Recipe show spec' do
  describe "as a visitor" do 
    context "when the user visits '/recipes/:id' aka the show page" do 
      it "shows a list of the recipe name, complexity, and genre" do 
        ingredient_1 = Ingredient.create!(name: "Onion", cost: 23)
        ingredient_2 = Ingredient.create!(name: "Lettuce", cost: 12)
        ingredient_3 = Ingredient.create!(name: "Chocolate", cost: 5)
        
        recipe_1 = Recipe.create!(name: "Salad", complexity: 2, genre: "Healthy")

        RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_1.id)
        RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_2.id)

        visit "recipes/#{recipe_1.id}"
        save_and_open_page
        expect(page).to have_content("List of Ingredients for #{recipe_1.name}")
        expect(page).to have_content("Complexity: #{recipe_1.complexity}")
        expect(page).to have_content("Genre: #{recipe_1.genre}")
        expect(page).to have_content("Ingredients Used for #{recipe_1.name}")
        expect(page).to have_content("#{ingredient_1.name}")
        expect(page).to have_content("#{ingredient_2.name}")
        expect(page).to_not have_content("#{ingredient_3.name}")


      end
    end 
  end 
end 