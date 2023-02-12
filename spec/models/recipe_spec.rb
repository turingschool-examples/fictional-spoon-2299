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

  describe 'instance_methods' do
    before (:each) do
      @ratatouille = Recipe.create!(name: "ratatouille", complexity: 3, genre: "Italian")

      @tomato = @ratatouille.ingredients.create!(name: "tomato", cost: 2)
      @salt = @ratatouille.ingredients.create!(name: "salt", cost: 3)
      @turkey = @ratatouille.ingredients.create!(name: "turkey", cost: 15)
    end
    describe '#total_cost' do
      it "calculates the total cost of a recipe's ingredients" do
        expect(@ratatouille.total_cost).to eq(20)
      end
    end
  end
end
