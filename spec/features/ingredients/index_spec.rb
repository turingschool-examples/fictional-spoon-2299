require 'rails_helper'

RSpec.describe Ingredients, type: :feature do
  let!(:cilantro) { Ingredient.create!(name: "Cilantro", cost: 1) }
  let!(:Onion) { Ingredient.create!(name: "Onion", cost: 2) }
  let!(:olives) { Ingredient.create!(name: "Olives", cost: 3) }
  let!(:spaghetti) Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")
  let!(:pizza) Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian")
  let!(:garden_salad) Recipe.create!(name: "Garden Salad", complexity: 2, genre: "Greek")

  describe 'relationships' do
  end
end