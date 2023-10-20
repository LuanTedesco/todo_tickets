class Attachment < ApplicationRecord
  belongs_to :ticket
  has_one_attached :file
  validates :name, :file, presence: true
end
