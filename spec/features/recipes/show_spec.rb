require 'rails_helper'

RSpec.describe "recipe#show" do
  describe "When I visit '/recipes/:id'" do
    before :each do
      @recipe_1 = Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian")
      @ing_1 = Ingredient.create!(name: "Salt", cost: 1)
      @ing_2 = Ingredient.create!(name: "Sauce", cost: 5)
      @ing_3 = Ingredient.create!(name: "Noodles", cost: 3)
      @spaghetti = RecipeIngredient.create(recipe_id: @recipe_1.id, ingredient_id: @ing_2.id)
    end
    it "Then I see the recipe's name, complexity and genre" do
      visit "/recipes/#{@recipe_1.id}"
      expect(page).to have_content(@recipe_1.name)
      expect(page).to have_content(@recipe_1.complexity)
      expect(page).to have_content(@recipe_1.genre)
    end

    it " I see a list of the names of the ingredients for the recipe." do 
      visit "/recipes/#{@recipe_1.id}"
      save_and_open_page
      expect(page).to have_content(@recipe_1.ingredients.name)
    end
  end
end