require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end
  
  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe '#class methods' do
    before do
      ingredient1 = Ingredient.create!(name: "Ground Beef", cost: 2) 
      ingredient2 = Ingredient.create!(name: "Salt", cost: 4) 
    end

    it 'should have a total cost' do
      expect(Ingredient.total_cost).to eq(6)
    end
  end
end
