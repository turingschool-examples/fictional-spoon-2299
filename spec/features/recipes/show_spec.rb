require 'rails_helper'

RSpec.describe 'the ingredients show page', type: :feature do
  before(:each) do
    @recipe_1 = Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian")
  end

  describe 'user story 2' do
    it 'displays the recipes name, complexity and genre' do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("#{@recipe_1.name}")
      expect(page).to have_content("#{@recipe_1.complexity}")
      expect(page).to have_content("#{@recipe_1.genre}")
    end
  end    
end  