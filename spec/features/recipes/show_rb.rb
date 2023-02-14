require 'rails_helper'

RSpec.describe '#index' do
  before(:each) do
    @salt = Ingredient.create!(name: 'Salt', cost: 2)
    @egg = Ingredient.create!(name: 'Egg', cost: 400)
    @cheese = Ingredient.create!(name: 'Cheese', cost: 5)
    @mushroom = Ingredient.create!(name: 'Mushroom', cost: 2)
    @spinach = Ingredient.create!(name: 'Spinach', cost: 3)

    @omelette = Recipe.create!(name: 'Omelette', complexity: 2, genre: "Breakfast")
    @omelette.add_ingredient(@cheese)
    @omelette.add_ingredient(@egg)
    @omelette.add_ingredient(@salt)
    @omelette.add_ingredient(@mushroom)
    @omelette.add_ingredient(@spinach)
  end

  describe 'As a user when I visit a Recipe show page' do
    it 'I should see' do
      visit "/recipes/#{@omelette.id}"

      expect(page).to have_content "#{@omelette.name}"
      expect(page).to have_content "Complexity: #{@omelette.complexity}"
      expect(page).to have_content "Genre: #{@omelette.genre}"

      expect(page).to have_content "Ingredients:\n#{@salt.name}, #{@egg.name}, #{@cheese.name}, #{@mushroom.name}, #{@spinach.name}"
    end
  end
end
