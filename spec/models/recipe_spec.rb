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

  before(:each) do
    @recipe_1 = Recipe.create!(name: "Tuna Sandwich", complexity: 1, genre: "Sammich")
    
    @ingredient_1 = @recipe_1.ingredients.create(name: "Tuna", cost: 5)
    @ingredient_2 = @recipe_1.ingredients.create(name: "Bell Pepper", cost: 2)
    @ingredient_3 = @recipe_1.ingredients.create(name: "Poppyseed Dressing", cost: 6)
  end

  describe 'instance methods' do
    describe '#total_cost' do
      it 'should return the total cost of the recipe' do
        expect(@recipe_1.total_cost).to eq(@ingredient_1.cost + @ingredient_2.cost + @ingredient_3.cost)
      end
    end
  end
end
