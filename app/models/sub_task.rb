class SubTask < ApplicationRecord
  belongs_to :ticket
  validates :title, presence: true
end
