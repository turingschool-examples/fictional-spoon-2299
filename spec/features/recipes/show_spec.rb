require 'rails_helper'

RSpec.describe "Recipe show page" do

  describe 'as a visitor' do
      let!(:tacos) { Recipe.create!(name: "Tacos", complexity: 1, genre: "Mexican") }

    it "I see the recipe's name, complexity and genre" do
      visit "/recipes/#{tacos.id}"
  
      expect(page).to have_content(pickles.name)
      expect(page).to have_content(pickles.cost)
    end
  end
end 