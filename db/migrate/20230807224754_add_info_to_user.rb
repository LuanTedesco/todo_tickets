class AddInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :status, :boolean, null: false, default: true
  end
end
