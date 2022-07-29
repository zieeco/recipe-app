class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  def total_foods
    recipe_foods.size
  end

  def total_price
    total = 0
    recipe_foods.each do |recipe|
      total += recipe.food.price * recipe.food.quantity
    end
    total
  end
end
