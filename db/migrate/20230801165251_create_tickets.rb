class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.references :priority, null: false, foreign_key: true
      t.references :column, null: false, foreign_key: true
      t.references :company, foreign_key: true
      t.references :departament, null: false, foreign_key: true
      t.date :date_end
      t.references :tag, foreign_key: true
      t.references :attachment, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :sub_tasks, foreign_key: true
      t.integer :automation_hours
      t.integer :execution_hours

      t.timestamps
    end
  end
end
