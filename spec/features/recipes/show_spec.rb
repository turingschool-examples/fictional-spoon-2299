require 'rails_helper'

RSpec.describe "Recipe show page" do

  describe 'as a visitor' do
      let!(:tacos) { Recipe.create!(name: "Tacos", complexity: 1, genre: "Mexican") }
      let!(:tortillas) { Ingredient.create!(name: "Tortillas", cost: 2) }
      let!(:recipe_ingredient) { RecipeIngredient.create!(recipe: tacos, ingredient: tortillas) }
    it "I see the recipe's name, complexity and genre" do
      visit "/recipes/#{tacos.id}"
  
      expect(page).to have_content(tacos.name)
      expect(page).to have_content(tacos.complexity)
      expect(page).to have_content(tacos.genre)
    end

    it "I see a list of the names of the ingredients for the recipe" do
      visit "/recipes/#{tacos.id}"
  
      expect(page).to have_content(tortillas.name)
      expect(page).to have_content(tortillas.cost)
    end
  end
end 