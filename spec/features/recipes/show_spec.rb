require "rails_helper"

RSpec.describe "Recipes Show Page" do
  describe "As a visitor" do
    describe "When I visit '/recipes/:id'" do
      it 'can see the recipes attributes and a list of the names of each ingredient for the recipe' do
        recipe = Recipe.create!(name: "Taco Meat", complexity: 1, genre: "Mexican")
        recipe.ingredients.create!(name: "Ground Beef", cost: 4)
        recipe.ingredients.create!(name: "Salt", cost: 1)
        recipe.ingredients.create!(name: "Taco Seasoning", cost: 2)

        Ingredient.create!(name: "Cereal", cost: 2)

        visit "/recipes/#{recipe.id}"

        expect(page).to have_content("Recipe: Taco Meat")
        expect(page).to have_content("Complexity: 1")
        expect(page).to have_content("Genre: Mexican")
        expect(page).to have_content("Ingredients: Ground Beef, Salt, Taco Seasoning")
        expect(page).to_not have_content("Cereal")
      end
    end
  end
end