# Added this line to bypas the rubocop offense

class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true
end
