class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.text :description
      t.string :url
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
