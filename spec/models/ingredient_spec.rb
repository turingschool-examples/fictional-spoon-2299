require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let!(:rosemary) {Ingredient.create!(name: "Rosemary", cost: 1)}
  let!(:tomato) {Ingredient.create!(name: "Tomato", cost: 4)}
  let!(:pasta) {Ingredient.create!(name: "Pasta", cost: 2)}
#   describe 'validations' do
#     it {should validate_presence_of :name}
#     it {should validate_presence_of :cost}
#   end
  
  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe '::order_by_alpha' do 
    it 'sorts the ingredients alphabetically' do 
      expect(Ingredient.order_by_alpha).to eq([pasta, rosemary, tomato])
    end
  end
end
