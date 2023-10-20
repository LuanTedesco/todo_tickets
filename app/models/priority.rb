class Priority < ApplicationRecord
  has_many :tickets
  validates :name, :level, presence: true
end
