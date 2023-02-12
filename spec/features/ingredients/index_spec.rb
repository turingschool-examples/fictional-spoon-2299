require 'rails_helper'

RSpec.describe 'Index feature spec' do
  describe "as a visitor" do 
    context "when the user visits '/ingredients' aka the index page" do 
      it "shows a list of all ingredients including their name and cost" do 
        ingredient_1 = Ingredient.create!(name: "Onion", cost: 23)
        ingredient_2 = Ingredient.create!(name: "Lettuce", cost: 12)

        visit "/ingredients"

        expect(page).to have_content("List of Ingredients")
        expect(page).to have_content("Onion: 23")
        expect(page).to have_content("Lettuce: 12")
        expect("List of Ingredients").to appear_before("Onion: 23")

      end
    end 
  end 
end 
   