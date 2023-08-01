class CreateSubTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_tasks do |t|
      t.string :title
      t.date :date_end
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
