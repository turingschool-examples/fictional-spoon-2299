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
    before(:each) do
      @ingredient_1 = Ingredient.create!(name: "Cereal", cost: 2)
      @ingredient_2 = Ingredient.create!(name: "Salt", cost: 1)
      @ingredient_3 = Ingredient.create!(name: "Beef", cost: 4)
    end

    describe '::total_cost' do
      it 'can total the cost of ingredients' do
        expect(Ingredient.total_cost).to eq(7)
      end
    end

    describe '::sort_alphabetically_by_name' do
      it 'can sort ingredients alphabetically by name' do
        expect(Ingredient.sort_alphabetically_by_name).to eq([@ingredient_3, @ingredient_1, @ingredient_2])
      end
    end
  end
end
