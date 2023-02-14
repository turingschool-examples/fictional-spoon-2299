require 'rails_helper'

RSpec.describe 'Recipe Show' do
  describe 'When I visit /recipes/:id' do
    before(:each) do
      @recipe1 = Recipe.create!(name: "Medium rare Filet Mignon", complexity: 3, genre: "French")

      @ingredient1 = Ingredient.create!(name: 'Filet Minon', cost: 5)
      @ingredient2 = Ingredient.create!(name: 'Paprika', cost: 2)
      @ingredient3 = Ingredient.create!(name: 'Mayonaise', cost: 999)

      @recipe_ingredients1 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient1.id)
      @recipe_ingredients2 = RecipeIngredient.create!(recipe_id: @recipe1.id, ingredient_id: @ingredient2.id)
    end
    it 'shows that specifc name, complexity, and genre of the recipe' do
      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content("#{@recipe1.name}: #{@recipe1.complexity}, #{@recipe1.genre}")
    end

    it 'shows a list of the names of the ingredients in the recipe' do
      visit "/recipes/#{@recipe1.id}"

      expect(page).to have_content("#{@ingredient1.name}")
      expect(page).to have_content("#{@ingredient2.name}")
    end
  end
end