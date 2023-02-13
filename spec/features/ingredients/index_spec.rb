require 'rails_helper'

RSpec.describe "Ingredient index page" do

  describe 'as a visitor' do
    before :each do
      @ingredient = Ingredient.create!(name: "Pickles", cost: 3)
    end
    it "I see a list of all the ingredients including their name and cost" do
      visit '/ingredients'

      expect(page).to have_content(@ingredient.name)
      expect(page).to have_content(@ingredient.cost)
    end
  end
end 