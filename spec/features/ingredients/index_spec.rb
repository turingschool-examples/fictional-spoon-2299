require 'rails_helper'

RSpec.describe "Ingredients Index Page" do 
  let!(:rosemary) {Ingredient.create!(name: "Rosemary", cost: 1)}
  let!(:tomato) {Ingredient.create!(name: "Tomato", cost: 4)}
  let!(:pasta) {Ingredient.create!(name: "Pasta", cost: 2)}

  describe 'When visiting /ingredients' do 
    it 'has a list of all ingredients including their name and cost' do 
      visit "/ingredients"

      expect(page).to have_content(rosemary.name)
      expect(page).to have_content(rosemary.cost)
      expect(page).to have_content(tomato.name)
      expect(page).to have_content(tomato.cost)
      expect(page).to have_content(pasta.name)
      expect(page).to have_content(pasta.cost)
    end
  end
end