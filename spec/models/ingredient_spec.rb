# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  #   describe 'validations' do
  #     it {should validate_presence_of :name}
  #     it {should validate_presence_of :cost}
  #   end

  describe 'relationships' do
    it { should have_many :recipe_ingredients }
    it { should have_many(:recipes).through(:recipe_ingredients) }
  end

  describe '.alphabetically' do
    it 'sorts self alphabetically' do
      pepper = Ingredient.create!(name: 'pepper', cost: 10)
      milk = Ingredient.create!(name: 'milk', cost: 1)
      sausage = Ingredient.create!(name: 'sausage', cost: 20)
      a = Ingredient.create!(name: 'a', cost: 20)
      z = Ingredient.create!(name: 'z', cost: 20)
      expect(Ingredient.alphabetically).to eq([a, milk, pepper, sausage, z])
    end
  end
end
