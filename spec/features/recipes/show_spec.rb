require "rails_helper"

RSpec.describe "Recipes Show Page" do
  describe "As a visitor" do
    describe "When I visit '/recipes/:id'" do
      before(:each) do
        @recipe = Recipe.create!(name: "Taco Meat", complexity: 1, genre: "Mexican")
        @recipe.ingredients.create!(name: "Ground Beef", cost: 4)
        @recipe.ingredients.create!(name: "Salt", cost: 1)
        @recipe.ingredients.create!(name: "Taco Seasoning", cost: 2)

        @extra_ingredient = Ingredient.create!(name: "Onion", cost: 2)
        visit "/recipes/#{@recipe.id}"
      end

      it 'can see the recipes attributes,a list of the names of each ingredient for the recipe and their total cost' do
        expect(page).to have_content("Recipe: Taco Meat")
        expect(page).to have_content("Complexity: 1")
        expect(page).to have_content("Genre: Mexican")
        expect(page).to have_content("Ingredients: Ground Beef, Salt, Taco Seasoning")
        expect(page).to have_content("Total Cost: 7")
        expect(page).to_not have_content("Onion")
      end

      it 'can see a form to add ingredients to the recipe and when submitted, be redirected to the show page with ingredients added to recipe' do
        expect(page).to have_content("Add Ingredients")
        expect(page).to have_field(:ingredient_id)
        expect(page).to have_button("Submit")

        fill_in :ingredient_id, with: "#{@extra_ingredient.id}"
        click_on "Submit"

        expect(current_path).to eq("/recipes/#{@recipe.id}")
        expect(page).to have_content("Onion")
      end
    end
  end
end