require 'rails_helper'

RSpec.describe Recipe, type: :model do
#   describe 'validations' do
#     it {should validate_presence_of :name}
#     it {should validate_presence_of :complexity}
#     it {should validate_presence_of :genre}
#   end
  before(:each) do
    @recipe_1 = Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian")
    @ingredient_2 = Ingredient.create!(name: 'Salt', cost: 4)
    @ingredient_5 = Ingredient.create!(name: 'Cheese', cost: 3)
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'user story 3' do
    it 'shows total cost of all of the ingredients in the recipe' do
      expect(Recipe.add_ingredients).to be(7)
    end
  end    
end
