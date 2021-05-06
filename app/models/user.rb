class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :sales
  has_many :courses
  has_one_attached :avatar
  enum role: %i[user admin instructor].freeze
  has_secure_password
end
