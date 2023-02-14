require 'rails_helper'

RSpec.describe Ingredient, type: :model do
#   describe 'validations' do
#     it {should validate_presence_of :name}
#     it {should validate_presence_of :cost}
#   end
  
  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe '#class_methods' do
    let!(:ground_beef) { Ingredient.create!(name: 'Ground Beef', cost: 8) }
    let!(:salt) { Ingredient.create!(name: 'Salt', cost: 2) }
    let!(:pepper) { Ingredient.create!(name: 'Black Pepper', cost: 3) }

    it 'can sort ingredients alphabetically by name' do
      expect(Ingredient.sort_alphabetical).to eq([pepper, ground_beef, salt])
    end
  end
end
