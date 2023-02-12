require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  context 'instance methods' do 
    describe 'sum_up method'
      it "will sum up the 'cost' attribute of all the ingredients" do 

        ingredient_1 = Ingredient.create!(name: "Onion", cost: 23)
        ingredient_2 = Ingredient.create!(name: "Lettuce", cost: 12)
        ingredient_3 = Ingredient.create!(name: "Chocolate", cost: 5)
        ingredient_4 = Ingredient.create!(name: "Banana", cost: 25)


        recipe_1 = Recipe.create!(name: "Salad", complexity: 2, genre: "Healthy")

        RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_1.id)
        RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_2.id)
        RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_3.id)

        expect(recipe_1.sum_up).to eq(40)

    end
  end
end
