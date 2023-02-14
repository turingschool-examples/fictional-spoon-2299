require 'rails_helper'

RSpec.describe Ingredient, type: :model do
#   describe 'validations' do
#     it {should validate_presence_of :name}
#     it {should validate_presence_of :cost}
#   end
  
  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe '#sort_alphabetically' do
    it 'sorts the recipes alphabetically' do
      @salt = Ingredient.create!(name: 'Salt', cost: 2)
      @egg = Ingredient.create!(name: 'Egg', cost: 400)
      @cheese = Ingredient.create!(name: 'Cheese', cost: 5)
      @mushroom = Ingredient.create!(name: 'Mushroom', cost: 2)
      @spinach = Ingredient.create!(name: 'Spinach', cost: 3)

      expect(Ingredient.sort_alphabetically).to eq [@cheese, @egg, @mushroom, @salt, @spinach]
    end
  end
end
