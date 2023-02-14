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


  describe '#instance_methods' do 
    it 'can find the total cost of a recipe' do 
      recipe_1 = Recipe.create!(name: "lasagna", complexity: 2, genre: "italian")
      ingredient_1 = recipe_1.ingredients.create!(name: "Salt", cost: 1)

      expect(recipe_1.cost).to eq(1)
    end
  end
end
