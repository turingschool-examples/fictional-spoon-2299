require 'rails_helper'

RSpec.describe '#index' do
before(:each) do
  @salt = Ingredient.create!(name: 'Salt', cost: 2)
  @egg = Ingredient.create!(name: 'Egg', cost: 400)
  @cheese = Ingredient.create!(name: 'Cheese', cost: 5)
  @curry_pow = Ingredient.create!(name: 'Curry Powder', cost: 1)
end

  describe 'as a visitor' do
    it 'I should see a list of all ingredients and their cost' do
      visit '/ingredients'

      expect(page).to have_content "Ingredients\nSalt Cost: 2"
      expect(page).to have_content "Egg Cost: 400"
      expect(page).to have_content "Cheese Cost: 5"
      expect(page).to have_content "Curry Powder Cost: 1"
    end
  end
end