class Notification < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  validates :title, :description, :ticket_id, :user_id, :departament_id, presence: true
end