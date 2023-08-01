class Ticket < ApplicationRecord
  belongs_to :category
  belongs_to :priority
  belongs_to :column
  belongs_to :company
  belongs_to :departament
  belongs_to :tag
  belongs_to :attachment
  belongs_to :comment
  belongs_to :sub_tasks
end
