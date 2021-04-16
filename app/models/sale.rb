class Sale < ApplicationRecord
  validates :customer_id, :course_id, presence: true
  belongs_to :user
  belongs_to :course
end
