require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end
  
  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'class_methods' do
    before(:each) do
      @tomato = Ingredient.create!(name: "tomato", cost: 2)
      @salt = Ingredient.create!(name: "salt", cost: 3)
      @turkey = Ingredient.create!(name: "turkey", cost: 15)
    end

    describe '::sort_alphabetically' do
      it 'lists the ingredients alphabetically by name' do
        expect(Ingredient.sort_alphabetically).to eq([@salt, @tomato, @turkey])
      end
    end
  end
end
