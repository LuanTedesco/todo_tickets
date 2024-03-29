class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to :departament
  has_many :tickets
  has_many :notifications
  has_one_attached :avatar
  validates :name, :email, :password, :password_confirmation, :departament_id, presence: true
end
