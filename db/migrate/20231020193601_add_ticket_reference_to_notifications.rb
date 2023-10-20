class AddTicketReferenceToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :ticket, foreign_key: true
    add_reference :notifications, :user, foreign_key: true
  end
end
