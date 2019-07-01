class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :email, :password, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitive => false}
end
