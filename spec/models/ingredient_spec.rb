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

  describe 'class methods' do
    it '.order_alphabetically' do

      @recipe_1 = Recipe.create!(name: "Tuna Sandwich", complexity: 1, genre: "Sammich")
    
      @ingredient_1 = @recipe_1.ingredients.create(name: "Tuna", cost: 5)
      @ingredient_2 = @recipe_1.ingredients.create(name: "Bell Pepper", cost: 2)
      @ingredient_3 = @recipe_1.ingredients.create(name: "Poppyseed Dressing", cost: 6)

      expect(@recipe_1.ingredients.order_alphabetically).to eq([@ingredient_2, @ingredient_3, @ingredient_1])
    end
  end
end
