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

  describe "#instance methods" do
  let!(:tacos) { Recipe.create!(name: "Breakfast Tacos", complexity: 1, genre: "Mexican") }
  let!(:tortillas) { Ingredient.create!(name: "Tortillas", cost: 2) }
  
  before :each do
    RecipeIngredient.create!(recipe: tacos, ingredient: tortillas)
  end

    describe "#total_cost" do
      it "returns the total cost of all ingredients in a recipe" do
        expect(tacos.total_cost).to eq(2)
      end
    end
  end
end
