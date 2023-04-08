class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :preparationTime, presence: true
  validates :cookingTime, presence: true
  validates :description, presence: true
  validates :public, presence: true
end
