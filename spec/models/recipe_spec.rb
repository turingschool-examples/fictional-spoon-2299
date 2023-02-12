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

   describe 'instance methods' do
    it 'can determine total cost of ingredients for a recipe' do
      spaghetti = Recipe.create!(name: "Spaghetti Bolognese", complexity: 1, genre: "Italian")
      beef = spaghetti.ingredients.create!(name: "ground beef", cost: 5)
      sauce = spaghetti.ingredients.create!(name: "tomato sauce", cost: 4)
      noods = spaghetti.ingredients.create!(name: "spaghetti noodles", cost: 3)

      expect(spaghetti.total_cost).to eq(12)
    end
  end
end
