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

  describe '#cost_of_ingredients' do
    it 'calcualtes cost of ingredients' do 
      recipe_1 = Recipe.create!(name: "Cheese Pizza", complexity: 3, genre: "Italian")
      ing_1 = Ingredient.create!(name: "Sauce", cost: 5)
      ing_2 = Ingredient.create!(name: "Mozzarella Cheese", cost: 10)
      RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ing_1.id)
      RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ing_2.id)

      expect(recipe_1.cost_of_ingredients).to eq(15)
    end
  end
end
