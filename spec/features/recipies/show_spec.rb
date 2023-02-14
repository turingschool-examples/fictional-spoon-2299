require 'rails_helper'

RSpec.describe "The recipie show" do
  describe "User Story 2" do
    it "shows the visitor the recipie with it's attributes" do
      recipe_1 = Recipe.create!(name: "Bean Soup", complexity: "Hard", genre: "Down Bad")

      visit "/recipes/#{recipe_1.id}"

      expect(page).to have_content(recipe_1.name)
      expect(page).to have_content(recipe_1.complexity)
      expect(page).to have_content(recipe_1.genre)
    end

    it "shows a list of ingredients for the receipe" do
      recipe_1 = Recipe.create!(name: "Bean Soup", complexity: "Hard", genre: "Down Bad")
      ingredient_1 = Ingredient.create!(name: "Beans", cost: 420)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_1.id)
      
      visit "/recipes/#{recipe_1.id}"

      expect(page).to have_content(ingredient_1.name)
    end
  end

  describe "User Story 3" do
    it "Shows the vistor the total cost of all the ingredients" do
      recipe_1 = Recipe.create!(name: "Bean Soup", complexity: "Hard", genre: "Down Bad")
      ingredient_1 = Ingredient.create!(name: "Beans", cost: 420)
      ingredient_2 = Ingredient.create!(name: "Water", cost: 80)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_1.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_2.id)

      visit "/recipes/#{recipe_1.id}"

      expect(page).to have_content("Total Cost: 500")

    end
  end
end