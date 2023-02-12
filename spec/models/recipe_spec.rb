require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:recipe) { Recipe.create!(name: "Salad", complexity: 9, genre: "dinner") }

  let!(:ingredient_1) { Ingredient.create!(name: "Croutons", cost: 4) }
  let!(:ingredient_2) { Ingredient.create!(name: "Beef", cost: 200) }

  let!(:recipe_ingredient_1) { RecipeIngredient.create!(recipe: recipe, ingredient: ingredient_1) }
  let!(:recipe_ingredient_2) { RecipeIngredient.create!(recipe: recipe, ingredient: ingredient_2) }


  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe '#add_ingredient_cost' do
    it 'gives a total cost for each ingredient in a recipe' do
      expect(recipe.add_ingredient_cost).to eq(204)
    end
  end

  describe '#order_names' do
    it 'sorts ingredient names alphabetically by name' do
      expect(recipe.order_names).to eq([ingredient_2.name, ingredient_1.name])
    end
  end
end
