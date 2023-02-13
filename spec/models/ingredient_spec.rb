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

  describe '.class methods/ scope' do 

    let!(:ground_beef) { Ingredient.create!(name: "Ground Beef", cost: 6) }
    let!(:garlic) { Ingredient.create!(name: "Garlic", cost: 1) }
    let!(:lasagna_noods) { Ingredient.create!(name: "Lasagna Noodles", cost: 1) }
    let!(:ricotta) { Ingredient.create!(name: "Ricotta", cost: 4) }
    let!(:mushrooms) { Ingredient.create!(name: "Mushrooms", cost: 3) }
    
    it 'returns the total cost' do 

      expect(Ingredient.total_cost).to eq(15)
    end
   
    it 'sorts ingredients alphabetically' do 
  
      expect(Ingredient.sort_alphabetically).to eq([garlic, ground_beef, lasagna_noods, mushrooms, ricotta])
    end
    
  end
end
