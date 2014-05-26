class Invitations < ActiveRecord::Base
  attr_accessible :invitation_sent_at, :invitee_id, :inviter_id, :project_id, :vendor_id
end
