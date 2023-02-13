require 'rails_helper'

RSpec.describe 'ingredients index page' do
  describe "when I visit /ingredients" do
    it 'lists all the ingredients with their attributes' do
      ingredients_1 = Ingredient.create!(name: 'salt', cost: 12)
      ingredients_2 = Ingredient.create!(name: 'pepper', cost: 14)
      ingredients_3 = Ingredient.create!(name: 'garlic', cost: 13)

      visit '/ingredients'

      expect(page).to have_content(ingredients_1.name)
      expect(page).to have_content(ingredients_1.cost)
      expect(page).to have_content(ingredients_2.name)
      expect(page).to have_content(ingredients_2.cost)
      expect(page).to have_content(ingredients_3.name)
      expect(page).to have_content(ingredients_3.cost)

    end
  end 
end 