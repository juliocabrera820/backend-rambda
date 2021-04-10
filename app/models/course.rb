class Course < ApplicationRecord
  validates :name, :description, :duration, presence: true
  has_one_attached :featured_image
end
