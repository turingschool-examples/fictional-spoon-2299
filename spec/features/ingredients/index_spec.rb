require 'rails_helper'

RSpec.describe "Ingredient index page" do

  describe 'as a visitor' do
      let!(:pickles) { Ingredient.create!(name: "Pickles", cost: 3) }
    it "I see a list of all the ingredients including their name and cost" do
      visit '/ingredients'
  
      expect(page).to have_content(pickles.name)
      expect(page).to have_content(pickles.cost)
    end
  end
end 