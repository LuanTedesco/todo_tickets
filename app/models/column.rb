class Column < ApplicationRecord
  has_many :tickets
  validates :title, :level, presence: true
end
