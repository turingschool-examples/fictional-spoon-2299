require 'rails_helper'

RSpec.describe Recipe, type: :model do
#   describe 'validations' do
#     it {should validate_presence_of :name}
#     it {should validate_presence_of :complexity}
#     it {should validate_presence_of :genre}
#   end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe '#total_cost' do 
    it "returns the total cost of ingredients" do 
      recipe_1 = Recipe.create!(name: 'Strip Steak', complexity: 1, genre: 'American?')
      ingredient_1 = Ingredient.create!(name: 'salt', cost: 12)
      ingredient_2 = Ingredient.create!(name: 'pepper', cost: 14)
      ingredient_3 = Ingredient.create!(name: 'garlic', cost: 13)
      ingredient_4 = Ingredient.create!(name: 'New York Strip', cost: 25)
      recipe_ingredient_1 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_1)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_2)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_3)
      recipe_ingredient_4 = RecipeIngredient.create!(recipe: recipe_1, ingredient: ingredient_4)

      expect(recipe_1.total_cost).to eq(64)
    end
  end

end
