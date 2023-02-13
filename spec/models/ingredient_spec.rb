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

  describe 'Extention1 - ::alphabetical' do
    let!(:tomato) { Ingredient.create!(name: "tomato", cost: 2) }
    let!(:mozzarella) { Ingredient.create!(name: "mozzarella", cost: 5) }
    let!(:garlic) { Ingredient.create!(name: "garlic", cost: 1) }  
    
    it 'should sort ingredients alphabetically' do
      expect(Ingredient.alphabetical).to eq([garlic, mozzarella, tomato])
    end
  end
end
