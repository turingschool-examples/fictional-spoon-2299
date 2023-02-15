require 'rails_helper'

RSpec.describe 'Ingredients Index' do
  describe 'When I visit /ingredients' do
    before(:each) do
      @ingredient1 = Ingredient.create!(name: 'Star Fruit', cost: 12)
      @ingredient2 = Ingredient.create!(name: 'Filet Minon', cost: 5)
      @ingredient3 = Ingredient.create!(name: 'Paprika', cost: 2)
    end

    it 'shows a list of all ingredients, including their name and cost: "Ground Beef: 2"' do
      visit "/ingredients"

      expect(page).to have_content("#{@ingredient1.name}: #{@ingredient1.cost}")
      expect(page).to have_content("#{@ingredient2.name}: #{@ingredient2.cost}")
      expect(page).to have_content("#{@ingredient3.name}: #{@ingredient3.cost}")
    end

    it 'shows a list of all ingredients in alphabetical order"' do
      visit "/ingredients"
      save_and_open_page
      expect(@ingredient2.name).to appear_before(@ingredient3.name)
      expect(@ingredient2.name).to appear_before(@ingredient1.name)
      expect(@ingredient3.name).to appear_before(@ingredient1.name)
    end
  end
end