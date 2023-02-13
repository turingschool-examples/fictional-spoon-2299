require 'rails_helper'

RSpec.describe 'the ingredients index page', type: :feature do
  before(:each) do
    ingredient_1 = Ingredient.create!(name: 'Ground Beef', cost: 2)
    ingredient_2 = Ingredient.create!(name: 'Salt', cost: 4)
    ingredient_3 = Ingredient.create!(name: 'Squash', cost: 1)
    ingredient_4 = Ingredient.create!(name: 'Salmon', cost: 7)
    ingredient_5 = Ingredient.create!(name: 'Cheese', cost: 3)
  end

  describe 'user story 1' do
    it 'displays a list of all the ingredients including their name and cost' do
      visit '/ingredients'

      expect(page).to have_content( 'Ground Beef: 2')
      expect(page).to have_content('Salt: 4') 
      expect(page).to have_content('Squash: 1')
      expect(page).to have_content('Salmon: 7')
      expect(page).to have_content('Cheese: 3')
    end
  end    
end  