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

  #Please make sure to run rails 'db:{drop,create,migrate,seed}' before running this test, as it will get all 
  #instances of ingredients otherwise and not successfully pass, even though the method is working.
  describe '#ordered_alphabetically' do
    it 'shows a list of all ingredients in alphabetical order"' do
      ingredient1 = Ingredient.create!(name: 'Star Fruit', cost: 12)
      ingredient2 = Ingredient.create!(name: 'Filet Minon', cost: 5)
      ingredient3 = Ingredient.create!(name: 'Paprika', cost: 2)

      expect(Ingredient.ordered_alphabetically).to eq([ingredient2, ingredient3, ingredient1])
    end
  end
end
