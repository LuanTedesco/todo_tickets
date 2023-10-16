class Ticket < ApplicationRecord
  belongs_to :category
  belongs_to :priority
  belongs_to :column
  belongs_to :departament
  has_many :comments
  has_many :sub_tasks
  has_many :attachments
  has_and_belongs_to_many :tags
end
