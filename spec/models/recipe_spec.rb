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

  describe 'methods' do
    it "can sum the total cost of its ingredients" do
      meat = Ingredient.create!(name: 'meat', cost: 20)
      pasta = Ingredient.create!(name: 'pasta', cost: 5)
      vege = Ingredient.create!(name: 'vegetable', cost: 10)
      spagetti = Recipe.create!(name: 'spagetti', complexity: 1, genre: 'Italian')
      recing1 = RecipeIngredient.create!(ingredient_id: meat.id, recipe_id: spagetti.id)
      recing2 = RecipeIngredient.create!(ingredient_id: pasta.id, recipe_id: spagetti.id)

      expect(spagetti.total_cost).to eq(25)
    end
  end
end