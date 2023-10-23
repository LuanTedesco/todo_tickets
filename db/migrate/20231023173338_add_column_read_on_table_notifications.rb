class AddColumnReadOnTableNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :read, :boolean, null: false, default: false
  end
end
