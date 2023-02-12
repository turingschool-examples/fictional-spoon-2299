require 'rails_helper'

RSpec.describe 'the ingredient index' do 
  describe 'As a visitor' do 
    describe 'When I visit the ingredient index page' do  
      it 'will have a list of all ingredients including name and cost' do 
        ingredient_1 = Ingredient.create!(name: "Salt", cost: 1)
        ingredient_2 = Ingredient.create!(name: "Pepper", cost: 2)
        visit '/ingredients'
       
        expect(page).to have_content(ingredient_1.name)
        expect(page).to have_content(ingredient_1.cost)
        expect(page).to have_content(ingredient_2.name)
        expect(page).to have_content(ingredient_2.cost)
      end
    end
  end
end