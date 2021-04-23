class Lesson < ApplicationRecord
  validates :title, :description, :video_url, presence: true
  belongs_to :course
end
