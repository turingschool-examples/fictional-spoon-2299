require 'rails_helper'

RSpec.describe Recipe, type: :model do
#   describe 'validations' do
#     it {should validate_presence_of :name}
#     it {should validate_presence_of :complexity}
#     it {should validate_presence_of :genre}
#   end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  let!(:gound_beef) { Ingredient.create!(name: 'Ground Beef', cost: 2)}
  let!(:salt) { Ingredient.create!(name: 'Salt', cost: 4)}
  let!(:noodles) { Ingredient.create!(name: 'noodles', cost: 1)}
  let!(:sauce) { Ingredient.create!(name: 'sauce', cost: 3)}
  
  let!(:pasta) { Recipe.create!(name: 'Pasta', complexity: 2, genre: 'Italian')}

  before do 
    RecipeIngredient.create!(recipe: pasta, ingredient: gound_beef)
    RecipeIngredient.create!(recipe: pasta, ingredient: salt)
    RecipeIngredient.create!(recipe: pasta, ingredient: noodles)
    RecipeIngredient.create!(recipe: pasta, ingredient: sauce)
  end 

  it "I see the total cost of all the ingredients in the recipe" do

    expect(pasta.total_cost).to eq(10)
  end
end
