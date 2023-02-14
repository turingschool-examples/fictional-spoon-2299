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

  describe '#instance_methods' do
    let!(:burger_patty) { Recipe.create!(name: 'Burger Patty', complexity: 2, genre: 'American') }

    before do
      burger_patty.ingredients.create!(name: 'Ground Beef', cost: 8)
      burger_patty.ingredients.create!(name: 'Salt', cost: 2)
    end

    it 'can calculate a total cost of ingredients' do
      expect(burger_patty.total_cost).to eq(10)
      expect(burger_patty.total_cost).to_not eq(6)
    end
  end
end
