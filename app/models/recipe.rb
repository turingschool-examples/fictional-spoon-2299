class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, :complexity, :genre, presence: true

  # def self.add_recipe_ingredient_cost
  #   require 'pry'; binding.pry
  #   self.ids.each do |id|
  #   end

  #   require 'pry'; binding.pry
  #   self.sum(:cost)
  # end


  def add_ingredient_cost
    ingredients.sum(:cost)
  end

  def order_names
    ingredients.name.order
  end
end