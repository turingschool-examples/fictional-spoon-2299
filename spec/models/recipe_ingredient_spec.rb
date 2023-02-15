require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  before do
    @pizza = Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian")
    @onion = @pizza.ingredients.create!(name: "Onion", cost: 2)
    @olives = @pizza.ingredients.create!(name: "Olives", cost: 3)
  end

  describe 'relationships' do
    it {should belong_to :recipe}
    it {should belong_to :ingredient}
  end

  describe '#find_ingredients' do
    it 'finds all ingredients associated to a recipe' do
      expect(RecipeIngredient.find_ingredients(@pizza.id)).to eq([@onion, @olives])
    end
  end

  describe '#total_cost' do
    it 'finds all ingredients associated to a recipe' do
      expect(RecipeIngredient.total_cost(@pizza.id)).to eq(5)
    end
  end
end
