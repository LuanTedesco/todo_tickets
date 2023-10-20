class AddFinishForSubtasks < ActiveRecord::Migration[7.0]
  def change
    add_column :sub_tasks, :finished, :boolean
    add_column :sub_tasks, :finished_at, :date
  end
end
