class AddDepartamentToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :departament, null: false, foreign_key: true
  end
end
