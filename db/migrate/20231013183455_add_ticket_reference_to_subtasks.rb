class AddTicketReferenceToSubtasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :sub_tasks, :ticket, null: false, foreign_key: true
  end
end
