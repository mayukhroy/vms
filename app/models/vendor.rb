class Vendor < ActiveRecord::Base
  attr_accessible :email, :name, :user_id
  has_many :services
  belongs_to :user
  has_many :projects, :through => :invitations
end
