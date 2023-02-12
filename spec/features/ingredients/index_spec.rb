require "rails_helper"

RSpec.describe "Ingredients Index Page" do
  describe "As a visitor" do
    describe "When I visit '/ingredients'" do
      it 'can see a list of all the ingredients including their name and cost, sorted alphabetically by name' do
        ingredient_1 = Ingredient.create!(name: "Salt", cost: 4)
        ingredient_2 = Ingredient.create!(name: "Ground Beef", cost: 2)

        visit '/ingredients'
        
        within(".ingredients") { 
          expect(page).to have_content("Ground Beef: 2")
          expect(page).to have_content("Salt: 4")

          expect(ingredient_2.name).to appear_before(ingredient_1.name)
        }
      end
    end
  end
end