class AddDepartmentToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :departament, null: false, foreign_key: true
  end
end
