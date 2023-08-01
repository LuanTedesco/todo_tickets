class CreateColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :columns do |t|
      t.string :title
      t.text :description
      t.integer :level
      t.boolean :status, default: true
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
