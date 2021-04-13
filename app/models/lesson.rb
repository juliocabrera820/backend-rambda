class Lesson < ApplicationRecord
  validates :lesson_number, :title, :description, :video_url, presence: true
  validates :lesson_number, numericality: { only_integer: true }
  belongs_to :course
end
