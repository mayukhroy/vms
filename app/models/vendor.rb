class Vendor < ActiveRecord::Base
  attr_accessible :email, :name, :user_id, :address, :contact_no
  has_many :services, :dependent => :destroy
  belongs_to :user
  has_many :projects, :through => :invitations
  #dependent: :destroy
  validates :email, :uniqueness => true
end
