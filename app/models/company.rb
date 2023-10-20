class Company < ApplicationRecord
  has_many :tickets
  validates :name, :cnpj, presence: true
end
