class Departament < ApplicationRecord
  has_many :tickets
  has_many :users
  has_many :categories
  validates :name, presence: true
end
