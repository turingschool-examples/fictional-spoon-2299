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

  describe 'methods' do
    it 'can list ingredients alphabetically' do
      meat = Ingredient.create!(name: 'meat', cost: 20)
      vege = Ingredient.create!(name: 'vegetable', cost: 10)
      pasta = Ingredient.create!(name: 'pasta', cost: 5)
      cheese = Ingredient.create!(name: 'cheese', cost: 15)
  
      expect(Ingredient.sort_by_name_alpha.to_a).to eq([cheese, meat, pasta, vege])
    end
  end  
end
