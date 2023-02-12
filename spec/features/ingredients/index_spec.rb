require "rails_helper"

RSpec.describe "Ingredients Index Page" do
  describe "As a visitor" do
    describe "When I visit '/ingredients'" do
      it 'can see a list of all the ingredients including their name and cost' do
        ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
        ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)

        visit '/ingredients'
        
        expect(page).to have_content("Ground Beef: 2")
        expect(page).to have_content("Salt: 4")
      end
    end
  end
end