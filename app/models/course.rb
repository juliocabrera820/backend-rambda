class Course < ApplicationRecord
  validates :name, :description, :duration, :price, presence: true
  validates :duration, numericality: { only_integer: true }
  has_one_attached :featured_image
  has_many :lessons, dependent: :destroy
  has_many :sales
end
