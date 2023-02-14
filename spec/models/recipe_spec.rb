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

  describe '#instance method' do
    let!(:pasta) { Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian") }

    before(:each) do
      pasta.ingredients.create!(name: "noodles", cost: 2)
      pasta.ingredients.create!(name: "butter", cost: 1)
    end

    describe '#total_cost' do
      it 'returns the total cost of ingredients for a recipe' do
        expect(pasta.total_cost).to eq(3)
      end
    end
  end
end
