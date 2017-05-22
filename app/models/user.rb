class User < ActiveRecord::Base
  has_many :links
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, :presence => true, :if => '!password.nil?'
  has_secure_password
end
