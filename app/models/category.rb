class Category < ApplicationRecord
  has_many :tickets
  belongs_to :departament
end
