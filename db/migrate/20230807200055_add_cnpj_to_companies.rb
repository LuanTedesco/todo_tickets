class AddCnpjToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :cnpj, :string, null: false, default: ''
  end
end
