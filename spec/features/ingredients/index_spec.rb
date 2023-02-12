require 'rails_helper'

describe "As a visitor" do
  before(:each) do
    @tomato = Ingredient.create!(name: "tomato", cost: 2)
    @salt = Ingredient.create!(name: "salt", cost: 3)
    @turkey = Ingredient.create!(name: "turkey", cost: 15)
  end
  describe "When I visit '/ingredients'" do
    it "shows a list of all the ingredients include thier name and cost" do
      visit '/ingredients'

      expect(page).to have_content(@tomato.name)
      expect(page).to have_content(@tomato.cost)
      expect(page).to have_content(@salt.name)
      expect(page).to have_content(@salt.cost)
      expect(page).to have_content(@turkey.name)
      expect(page).to have_content(@turkey.cost)
    end
  end
end