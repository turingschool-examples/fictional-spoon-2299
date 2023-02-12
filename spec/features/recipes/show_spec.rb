require 'rails_helper'

RSpec.describe Recipe, type: :feature do
  let!(:gound_beef) { Ingredient.create!(name: 'Ground Beef', cost: 2)}
  let!(:salt) { Ingredient.create!(name: 'Salt', cost: 4)}
  let!(:noodles) { Ingredient.create!(name: 'noodles', cost: 1)}
  let!(:sauce) { Ingredient.create!(name: 'sauce', cost: 3)}
  
  let!(:pasta) { Recipe.create!(name: 'Pasta', complexity: 2, genre: 'Italian')}

  before do 
    RecipeIngredient.create!(recipe: pasta, ingredient: gound_beef)
    RecipeIngredient.create!(recipe: pasta, ingredient: salt)
    RecipeIngredient.create!(recipe: pasta, ingredient: noodles)
    RecipeIngredient.create!(recipe: pasta, ingredient: sauce)
  end 
  describe 'as a visitor to "/recipes/:id"' do
    it " see the recipe's name, complexity and genre, a list of the names of the ingredients for the recipe" do

      visit "/recipes/#{pasta.id}"

      expect(page).to have_content(pasta.name)
      expect(page).to have_content(pasta.complexity)
      expect(page).to have_content(pasta.genre)

      expect(page).to have_content("Ground Beef")
      expect(page).to have_content("Salt")
    end
  end
end
