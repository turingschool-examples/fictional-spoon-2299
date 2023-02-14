require 'rails_helper'

RSpec.describe "Recipe show page" do

  describe 'as a visitor' do
    let!(:tacos) { Recipe.create!(name: "Breakfast Tacos", complexity: 1, genre: "Mexican") }
    let!(:tortillas) { Ingredient.create!(name: "Tortillas", cost: 2) }
    let!(:eggs) { Ingredient.create!(name: "Eggs", cost: 100) }
    let!(:potato) { Ingredient.create!(name: "Potato", cost: 1) }
    let!(:cheese) { Ingredient.create!(name: "Cheese", cost: 4) }

    before :each do
      RecipeIngredient.create!(recipe: tacos, ingredient: tortillas)
      RecipeIngredient.create!(recipe: tacos, ingredient: eggs)
      RecipeIngredient.create!(recipe: tacos, ingredient: potato)
      RecipeIngredient.create!(recipe: tacos, ingredient: cheese)
    end

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

    it "I see the total cost of all of the ingredients in the recipe" do
      visit "/recipes/#{tacos.id}"
     
      expect(page).to have_content("Total Cost:")
      expect(page).to have_content("107")
    end
  end
end 