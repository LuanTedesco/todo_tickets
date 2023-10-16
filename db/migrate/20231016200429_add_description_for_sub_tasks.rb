class AddDescriptionForSubTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :sub_tasks, :description, :string
  end
end
