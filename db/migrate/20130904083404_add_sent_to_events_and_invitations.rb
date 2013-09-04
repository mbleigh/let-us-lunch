class AddSentToEventsAndInvitations < ActiveRecord::Migration
  def change
    add_column :events, :sent, :boolean
    add_column :invitations, :sent, :boolean
  end
end
