require 'rails_helper' 

RSpec.describe "Recipes Show Page" do 
  let!(:good_pasta) {Recipe.create!(name: "Good Pasta", complexity: 2, genre: "Italian")}
  let!(:rosemary) {good_pasta.ingredients.create!(name: "Rosemary", cost: 1)}
  let!(:tomato) {good_pasta.ingredients.create!(name: "Tomato", cost: 4)}
  let!(:pasta) {good_pasta.ingredients.create!(name: "Pasta", cost: 2)}

  describe 'When visiting recipe show page(/recipes/:id)' do 
    it 'has receipes name, complexity, genre and the ingredients' do 
      visit "/recipes/#{good_pasta.id}"

      expect(page).to have_content(good_pasta.name)
      expect(page).to have_content(good_pasta.complexity)
      expect(page).to have_content(good_pasta.genre)
      expect(page).to have_content(rosemary.name)
      expect(page).to have_content(tomato.name)
      expect(page).to have_content(pasta.name)
    end
  end
end
  
