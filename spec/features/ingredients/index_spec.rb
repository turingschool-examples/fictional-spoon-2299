require 'rails_helper'



RSpec.describe '/ingredients' do
  let!(:ingredient1) { Ingredient.create!(name: "Ground Beef", cost: 2) }
  
  # User Story 1
  
  describe 'As a visitor' do
    describe 'When I visit /ingredients' do
      it 'I see a list of all the ingredients including their name and cost' do
        visit "/ingredients"

        expect(page).to have_content("Name: #{ingredient1.name}")
        expect(page).to have_content("Cost: #{ingredient1.cost}")
      end
    end
  end
end