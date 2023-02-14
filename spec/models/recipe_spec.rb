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
    recipe1 = Recipe.create!(name: 'Sandvich', complexity: 1, genre: "French")
    ingredient1 = recipe1.ingredients.create!(name: 'Turkey', cost: 4)
    ingredient2 = recipe1.ingredients.create!(name: 'Cheddar', cost: 13)
    ingredient3 = recipe1.ingredients.create!(name: 'Bread', cost: 2)

    it 'returns the sum of the ingredients' do
      expect(recipe1.total_cost).to eq(ingredient1.cost+ingredient2.cost+ingredient3.cost)
      expect(recipe1.total_cost).to eq(19)
    end
  end
end
