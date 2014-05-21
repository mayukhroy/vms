class Invitations < ActiveRecord::Base
  attr_accessible :intiver_id, :invitation_sent_at, :invitee_id, :project_id, :vendor_id
end
