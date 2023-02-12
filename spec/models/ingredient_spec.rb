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

  describe 'Class Methods' do
    describe '::total_cost' do
      it 'can total the cost of ingredients' do
        Ingredient.create!(name: "Cereal", cost: 2)
        Ingredient.create!(name: "Salt", cost: 1)
        Ingredient.create!(name: "Beef", cost: 4)

        expect(Ingredient.total_cost).to eq(7)
      end
    end
  end
end
