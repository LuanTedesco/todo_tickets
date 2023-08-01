class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
