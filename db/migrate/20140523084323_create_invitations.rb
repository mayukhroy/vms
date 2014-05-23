class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :vendor_id
      t.integer :inviter_id
      t.integer :invitee_id
      t.integer :project_id
      t.datetime :invitaion_sent_at

      t.timestamps
    end
  end
end
