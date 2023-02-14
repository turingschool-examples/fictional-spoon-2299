require 'rails_helper'

RSpec.describe 'Ingredients Index' do
  describe 'When I visit /ingredients' do
    before(:each) do
      @ingredient1 = Ingredient.create!(name: 'Filet Minon', cost: 5)
      @ingredient2 = Ingredient.create!(name: 'Paprika', cost: 2)
    end
    it 'shows a list of all ingredients, including their name and cost: "Ground Beef: 2"' do
      visit "/ingredients"

      expect(page).to have_content("#{@ingredient1.name}: #{@ingredient1.cost}")
      expect(page).to have_content("#{@ingredient2.name}: #{@ingredient2.cost}")
    end
  end
end