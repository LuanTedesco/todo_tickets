class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :description
      t.date :date_send

      t.timestamps
    end
  end
end
