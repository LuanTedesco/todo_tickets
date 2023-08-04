class Ticket < ApplicationRecord
  belongs_to :category
  belongs_to :priority
  belongs_to :column
  belongs_to :departament
  has_many_attached :attachments
end
