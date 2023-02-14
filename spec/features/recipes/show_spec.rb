require 'rails_helper'

RSpec.describe "Ingredients Index Page", type: :feature do

  before(:each) do
    @recipe_1 = Recipe.create!(name: "Tuna Sandwich", complexity: 1, genre: "Sammich")
    
    @ingredient_1 = @recipe_1.ingredients.create(name: "Tuna", cost: 5)
    @ingredient_2 = @recipe_1.ingredients.create(name: "Bell Pepper", cost: 2)
    @ingredient_3 = @recipe_1.ingredients.create(name: "Poppyseed Dressing", cost: 6)
    @ingredient_4 = Ingredient.create(name: "Celery", cost: 2)
  end
  
  describe "User Story 2, as a visitor visiting '/recipes/:id'" do
    it 'lists all the recipes with their data, and ingredient names' do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("Tuna Sandwich")
      expect(page).to have_content("1")
      expect(page).to have_content("Sammich")

      expect(page).to have_content("Tuna")
      expect(page).to have_content("Bell Pepper")
      expect(page).to have_content("Poppyseed Dressing")
    end
  end

  describe "User Story 3, as a visitor visiting '/recipes/:id'" do
    it 'gives the total cost of the dish (from each ingredient)' do
      visit "/recipes/#{@recipe_1.id}"
      expect(page).to have_content(@ingredient_1.cost + @ingredient_2.cost + @ingredient_3.cost)
    end
  end

  describe "Extension 2 - Add an Ingredient to a Recipe" do
    describe "as a visitor visiting '/recipes/:id'" do
      it "has a form to add an ingredient" do
        @ingredient_4 = @recipe_1.ingredients.create(name: "Celery", cost: 2)
        visit "/recipes/#{@recipe_1.id}"
        fill_in "Add Ingredient by ID", with: @ingredient_4.id
        click_button "Add Ingredient"

        expect(page).to have_current_path("/recipes/#{@recipe_1.id}")
        expect(page).to have_content(@ingredient_4.name)
      end
    end
  end
end