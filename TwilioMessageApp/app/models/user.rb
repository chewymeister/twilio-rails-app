class User < ActiveRecord::Base
  has_many :transactions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, message: "you must fill in your email"
  validates_presence_of :password, message: "you must fill in a password"
  validates_presence_of :password_confirmation, message: "you must confirm your password"
  validates_confirmation_of :password, message: "Your password didn't match. Please try again"
end
