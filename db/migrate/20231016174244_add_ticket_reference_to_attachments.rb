class AddTicketReferenceToAttachments < ActiveRecord::Migration[7.0]
  def change
    add_reference :attachments, :ticket, null: false, foreign_key: true
  end
end
