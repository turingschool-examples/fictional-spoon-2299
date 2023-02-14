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

	describe 'total_cost' do
		it 'can sum the cost of the ingredients' do
			pot_pie = Recipe.create!(name: 'Pot Pie', complexity: 6, genre: "homestyle")    
			chicken = pot_pie.ingredients.create!(name: "chicken", cost: 8)
			mushrooms = pot_pie.ingredients.create!(name: "mushrooms", cost: 3)
			stock = pot_pie.ingredients.create!(name: "chicken stock", cost: 3)
			crust = pot_pie.ingredients.create!(name: "pie crust", cost: 4)

			expect(pot_pie.total_cost).to eq(18)
		end
	end
end
