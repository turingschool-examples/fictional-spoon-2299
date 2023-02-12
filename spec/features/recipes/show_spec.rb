require 'rails_helper'

describe "As a visitor" do
  before (:each) do
    @ratatouille = Recipe.create!(name: "ratatouille", complexity: 3, genre: "Italian")
    @sandwich = Recipe.create!(name: "sandwich", complexity: 1, genre: "Broke Food")

    @tomato = @ratatouille.ingredients.create!(name: "tomato", cost: 2)
    @salt = @ratatouille.ingredients.create!(name: "salt", cost: 3)
    @turkey = @ratatouille.ingredients.create!(name: "turkey", cost: 15)
    @bread = @sandwich.ingredients.create!(name: "bread", cost: 5)
  end
  describe "when I visit '/recipes/:id'" do
    it "shows the recipe's name, complexity and genre" do
      visit "/recipes/#{@ratatouille.id}"

      expect(page).to have_content(@ratatouille.name)
      expect(page).to_not have_content(@sandwich.name)
      expect(page).to have_content(@ratatouille.complexity)
      expect(page).to have_content(@ratatouille.genre)
    end

    it "lists the names of the ingredients for the recipe" do
      visit "/recipes/#{@ratatouille.id}"

      expect(page).to have_content(@tomato.name)
      expect(page).to have_content(@salt.name)
      expect(page).to have_content(@turkey.name)
      expect(page).to_not have_content(@bread.name)
    end

    it "shows the total cost of all the ingredients in the recipe" do
      visit "/recipes/#{@ratatouille.id}"

      total_cost = @tomato.cost + @salt.cost + @turkey.cost
      expect(page).to have_content("Total Cost: #{@total_cost}")
    end
  end
end