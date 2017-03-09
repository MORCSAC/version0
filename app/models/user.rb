class User < ApplicationRecord



  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence:true, length:{maximum:50}, format: {with:VALID_EMAIL_REGEX}, uniqueness:{case_sensitive: false} ,confirmation: true
  validates :first_name, presence:true
  validates :last_name,presence: true

  has_secure_password :validations => false




end
