require 'rails_helper'

RSpec.describe 'Ingredients Index Page', type: :feature do
  describe 'As a visitor' do
		let!(:flour) { Ingredient.create!(name: 'Flour', cost: 2) }
		let!(:eggs) { Ingredient.create!(name: 'Eggs', cost: 6) }
		let!(:butter) { Ingredient.create!(name: 'Butter', cost: 3) }
		
		it 'I see a list of all ingredients name and cost' do
			visit '/ingredients'
			
			expect(page).to have_content(flour.name)
			expect(page).to have_content(flour.cost)
			expect(page).to have_content(eggs.name)
			expect(page).to have_content(eggs.cost)
			expect(page).to have_content(butter.name)
			expect(page).to have_content(butter.cost)
		end
	end
end
