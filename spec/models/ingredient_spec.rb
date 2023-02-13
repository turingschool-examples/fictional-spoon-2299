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

  describe '.class methods/ scope' do 
    before do 
      Ingredient.create!(name: "Ground Beef", cost: 6)
      Ingredient.create!(name: "Garlic", cost: 1)
      Ingredient.create!(name: "Lasagna Noodles", cost: 1)
      Ingredient.create!(name: "Ricotta", cost: 4)
      Ingredient.create!(name: "Mushrooms", cost: 3)
    end
    describe '.total_cost' do 
      it 'returns the total cost' do 
        expect(Ingredient.total_cost).to eq(15)
      end
    end
  end
end
