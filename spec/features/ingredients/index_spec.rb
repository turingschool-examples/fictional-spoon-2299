require 'rails_helper'

RSpec.describe "Ingredients Index" do
  describe "As a visitor" do
    before :each do 
      @ing_1 = Ingredient.create!(name: "Noodles", cost: 3)
      @ing_2 = Ingredient.create!(name: "Salt", cost: 1)
    end
    describe "When I visit '/ingredients'"do
      it "I see a list of all the ingredients including their name and cost" do
        visit '/ingredients'


        expect(page).to have_content(@ing_1.name)
        expect(page).to have_content(@ing_1.cost)
        expect(page).to have_content(@ing_2.name)
        expect(page).to have_content(@ing_2.cost)
      end
    end
  end
end