require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let!(:good_pasta) {Recipe.create!(name: "Good Pasta", complexity: 2, genre: "Italian")}
  let!(:rosemary) {good_pasta.ingredients.create!(name: "Rosemary", cost: 1)}
  let!(:tomato) {good_pasta.ingredients.create!(name: "Tomato", cost: 4)}
  let!(:pasta) {good_pasta.ingredients.create!(name: "Pasta", cost: 2)}
#   describe 'validations' do
#     it {should validate_presence_of :name}
#     it {should validate_presence_of :complexity}
#     it {should validate_presence_of :genre}
#   end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe 'ingredients_total_cost' do 
    it 'calculates the total cost of ingredients for the recipe' do 
      expect(good_pasta.ingredients_total_cost).to eq(7)
    end
  end
end
