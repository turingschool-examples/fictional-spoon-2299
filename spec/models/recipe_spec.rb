require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

	describe '#total_cost' do
		let!(:flour) { Ingredient.create!(name: 'Flour', cost: 2) }
		let!(:eggs) { Ingredient.create!(name: 'Eggs', cost: 6) }
		let!(:butter) { Ingredient.create!(name: 'Butter', cost: 3) }
		
		let!(:biscuits) { Recipe.create!(name: 'Biscuits', complexity: 1, genre: 'Bread') }

		let!(:biscuits_ingredients_1) { RecipeIngredient.create!(recipe: biscuits, ingredient: flour)}
		let!(:biscuits_ingredients_2) { RecipeIngredient.create!(recipe: biscuits, ingredient: eggs)}
		let!(:biscuits_ingredients_3) { RecipeIngredient.create!(recipe: biscuits, ingredient: butter)}
		
		it 'returns total cost of all ingredients in recipe' do
			expect(biscuits.total_cost).to eq(11)
		end
	end
end
