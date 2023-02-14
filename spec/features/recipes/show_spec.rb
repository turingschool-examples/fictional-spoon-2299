require 'rails_helper' 

  RSpec.describe 'a recipes show page' do
    describe 'As a visitor' do 
      describe 'When I visit a recipes show page' do 
        it 'will show the recipes name, complexity, genre and all of the ingredients' do 
          recipe_1 = Recipe.create!(name: "lasagna", complexity: 2, genre: "italian")
          ingredient_1 = recipe_1.ingredients.create!(name: "Salt", cost: 1)
          ingredient_2 = Ingredient.create!(name: "Pepper", cost: 2)
        
          visit "/recipes/#{recipe_1.id}"

          expect(page).to have_content(recipe_1.name)
          expect(page).to have_content(recipe_1.complexity)
          expect(page).to have_content(recipe_1.genre)
          expect(page).to have_content("Ingredients")
          expect(page).to have_content(ingredient_1.name)   
      end

      it 'will display the total cost of all of the ingredients of a recipe' do 
        recipe_1 = Recipe.create!(name: "lasagna", complexity: 2, genre: "italian")
        ingredient_1 = recipe_1.ingredients.create!(name: "Salt", cost: 1)
        ingredient_2 = Ingredient.create!(name: "Pepper", cost: 2)

        expect(page).to have_content(recipe_1.cost)
      end
    end
  end
end
