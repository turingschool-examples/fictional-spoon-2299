require 'rails_helper'

RSpec.describe '/ingredients', type: :feature do
  let!(:tomato) { Ingredient.create!(name: "tomato", cost: 2) }
  let!(:mozzarella) { Ingredient.create!(name: "mozzarella", cost: 5) }
  let!(:garlic) { Ingredient.create!(name: "garlic", cost: 1) }

  describe 'user story 1' do
    it 'should display list of all ingredients & attributes' do
      visit '/ingredients'
      
      expect(page).to have_content("Name: #{tomato.name}")
      expect(page).to have_content("Cost: #{tomato.cost}")

      expect(page).to have_content("Name: #{mozzarella.name}")
      expect(page).to have_content("Name: #{mozzarella.cost}")

      expect(page).to have_content("Name: #{garlic.name}")
      expect(page).to have_content("Name: #{garlic.cost}")
    end
  end
end