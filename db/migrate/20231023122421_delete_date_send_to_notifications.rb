class DeleteDateSendToNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :date_send
  end
end
