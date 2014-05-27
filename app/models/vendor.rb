class Vendor < ActiveRecord::Base
  attr_accessible :email, :name, :user_id, :address, :contact_no
  has_many :services, :dependent => :destroy
  belongs_to :user
  has_many :projects, :through => :invitations
 #dependent: :destroy
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, :presence => true
end
