class Invitation < ActiveRecord::Base
  attr_accessible :invitation_sent_at, :invitee_id, :inviter_id, :project_id, :vendor_id
  belongs_to :vendor
  belongs_to :project
  belongs_to :user
end
