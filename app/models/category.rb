class Category < ApplicationRecord
  has_many :tickets
  belongs_to :departament
  validates :name, presence: true
end
