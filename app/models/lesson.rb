class Lesson < ApplicationRecord
  validates :lesson_number, :title, :description, :video_url, presence: true
  belongs_to :course
end
