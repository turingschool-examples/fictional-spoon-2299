require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end
  
  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

	describe '#sort_by_name' do
		let!(:flour) { Ingredient.create!(name: 'Flour', cost: 2) }
		let!(:eggs) { Ingredient.create!(name: 'Eggs', cost: 6) }
		let!(:butter) { Ingredient.create!(name: 'Butter', cost: 3) }
		
		it 'sorts ingredients alphabetically by name' do
			expect(Ingredient.sort_by_name).to eq([butter, eggs, flour])
		end
	end
end
