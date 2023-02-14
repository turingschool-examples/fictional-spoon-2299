require 'rails_helper'

RSpec.describe '#index' do
  before(:each) do
    @salt = Ingredient.create!(name: 'Salt', cost: 2)
    @egg = Ingredient.create!(name: 'Egg', cost: 400)
    @cheese = Ingredient.create!(name: 'Cheese', cost: 5)
    @mushroom = Ingredient.create!(name: 'Mushroom', cost: 2)
    @spinach = Ingredient.create!(name: 'Spinach', cost: 3)
    @curry_pow = Ingredient.create!(name: 'Curry Powder', cost: 1)
 
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

      expect(page).to have_content "Ingredients:\n#{@cheese.name}, #{@egg.name}, #{@mushroom.name}, #{@salt.name}, #{@spinach.name}"
    end

    it 'I should see the total cost of the recipe' do
      visit "/recipes/#{@omelette.id}"
      
      expect(page).to have_content "Total Recipe Cost: #{@omelette.cost}"
    end

    it 'has a form to add an ingredient to the recipe' do 
      visit "/recipes/#{@omelette.id}"

      fill_in "ingredient_id", with: "#{@curry_pow.id}"
      click_button "Add Ingredient"

      expect(current_path).to eq "/recipes/#{@omelette.id}"

      expect(page).to have_content "#{@curry_pow.name}"
    end
  end
end
