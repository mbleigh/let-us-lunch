class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.belongs_to :event, index: true
      t.string :token
      t.string :response
      t.string :email
      t.string :message

      t.timestamps
    end
  end
end
