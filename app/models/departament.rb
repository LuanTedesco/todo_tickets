class Departament < ApplicationRecord
  has_many :tickets
  has_many :users
end
