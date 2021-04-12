class Customer < ApplicationRecord
  validates :name, :email, :password, presence: true
  has_many :sales
end
