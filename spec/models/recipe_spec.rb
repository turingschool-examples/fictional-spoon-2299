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

  describe 'US3 - #total_cost' do
    let!(:pizza) { Recipe.create!(name: "pizza", complexity: 3, genre: "Yummy") }

    let!(:tomato) { Ingredient.create!(name: "tomato", cost: 2) }
    let!(:mozzarella) { Ingredient.create!(name: "mozzarella", cost: 5) }
    let!(:garlic) { Ingredient.create!(name: "garlic", cost: 1) }  

    let!(:recipe_ingredient1) { RecipeIngredient.create!(recipe: pizza, ingredient: tomato) }
    let!(:recipe_ingredient2) { RecipeIngredient.create!(recipe: pizza, ingredient: mozzarella) }
    let!(:recipe_ingredient3) { RecipeIngredient.create!(recipe: pizza, ingredient: garlic) }
  
    it "can return the total cost of all ingredients for one recipe" do
      expect(pizza.total_cost).to eq(8)
    end
  end

end
