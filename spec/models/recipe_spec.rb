require 'rails_helper'

RSpec.describe Recipe, type: :model do
  #   describe 'validations' do
  #     it {should validate_presence_of :name}
  #     it {should validate_presence_of :complexity}
  #     it {should validate_presence_of :genre}
  #   end

  describe 'relationships' do
    it { should have_many :recipe_ingredients }
    it { should have_many(:ingredients).through(:recipe_ingredients) }
  end

  describe '#cost' do
    it 'totals the cost of the ingredients for a recipe' do
      recipe = Recipe.create!(name: 'Chili', complexity: 1, genre: 'southwestern')
      pepper = Ingredient.create!(name: 'pepper', cost: 10)
      tomato = Ingredient.create!(name: 'whole-peeled tomatoes', cost: 1)
      bean = Ingredient.create!(name: 'kidney beans', cost: 20)
      ring1 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: pepper.id)
      ring2 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: tomato.id)
      ring3 = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bean.id)
      expect(recipe.cost).to eq(31)
    end
  end
end
