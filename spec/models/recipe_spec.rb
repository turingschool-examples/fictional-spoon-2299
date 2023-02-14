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

  describe '#cost' do 
    it 'sums the cost of all ingredients' do
      @salt = Ingredient.create!(name: 'Salt', cost: 2)
      @egg = Ingredient.create!(name: 'Egg', cost: 400)
      @cheese = Ingredient.create!(name: 'Cheese', cost: 5)
      @mushroom = Ingredient.create!(name: 'Mushroom', cost: 2)
      @spinach = Ingredient.create!(name: 'Spinach', cost: 3)
  
      @omelette = Recipe.create!(name: 'Omelette', complexity: 2, genre: "Breakfast")
      @omelette.add_ingredient(@cheese)
      @omelette.add_ingredient(@egg)
      @omelette.add_ingredient(@salt)
      @omelette.add_ingredient(@mushroom)
      @omelette.add_ingredient(@spinach)

      expect(@omelette.cost).to eq 412
    end
  end
end
