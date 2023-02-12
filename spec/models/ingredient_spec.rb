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

  describe 'class methods' do 
    context 'self.alphabetize' do 
      it "alphabetizes" do 
        
      ingredient_1 = Ingredient.create!(name: "Onion", cost: 23)
      ingredient_2 = Ingredient.create!(name: "Lettuce", cost: 12)

      expect(Ingredient.alphabetize).to eq([ingredient_2, ingredient_1])

      end 
    end
  end 
end
