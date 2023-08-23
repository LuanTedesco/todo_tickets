class AddUserOfCriationToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :name_user, :string
    add_column :tickets, :avatar_user, :string
  end
end
