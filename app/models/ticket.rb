class Ticket < ApplicationRecord
  belongs_to :category
  belongs_to :priority
  belongs_to :column
  belongs_to :departament
  has_many_attached :files

  validates :files, attached: true, limit: { min: 1, max: 3 }, content_type: %i[png jpg jpeg mp3 pdf]
end
