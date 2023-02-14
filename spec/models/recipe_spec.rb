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

  describe 'instance method' do
    describe '#total_cost' do
      let!(:beef) {Ingredient.create!(name: "Ground Beef", cost: 2)}
      let!(:carrot) {Ingredient.create!(name: "Carrot", cost: 1)}
      let!(:ham) {Ingredient.create!(name: "Ham", cost: 3)}
      let!(:stew) {Recipe.create!(name: "Beef Stew", complexity: 5, genre: "Stew")}
      let!(:pie) {Recipe.create!(name: "Ham Pie", complexity: 10, genre: "Weird")}

      it 'returns the total cost of all ingredients in a recipe' do
        RecipeIngredient.create!(recipe: stew, ingredient: beef)
        RecipeIngredient.create!(recipe: stew, ingredient: carrot)

        expect(stew.total_cost).to eq(3)
      end
    end
  end
end
