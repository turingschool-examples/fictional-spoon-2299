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

  describe 'class methods' do
    let!(:pasta) { Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian") }
    let!(:noodle) { Ingredient.create!(name: 'Noodle', cost: 5) }
    let!(:cheese) { Ingredient.create!(name: 'Cheese', cost: 10) }
    
    before do
      RecipeIngredient.create!(recipe: pasta, ingredient: noodle)
      RecipeIngredient.create!(recipe: pasta, ingredient: cheese)
    end
    describe 'total_cost' do
      it 'should return the total cost of ingredients' do
        expect(pasta.total_cost).to eq(7.5)
      end
    end
  end
end
