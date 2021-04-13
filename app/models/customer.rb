class Customer < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :sales
end
