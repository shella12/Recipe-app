class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparationTime, presence: true
  validates :cookingTime, presence: true
  validates :description, presence: true
  validates :public, presence: true

  def total_price
    foods.sum { |food| food.price * food.quantity }
  end

  def foods_count
    foods.length
  end
  scope :public_recipes, -> { where(public: true).order(created_at: :desc) }
end
