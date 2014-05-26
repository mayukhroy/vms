class Project < ActiveRecord::Base
  attr_accessible :name, :services_ids, :user_id, :vendor_id
  belongs_to :user
  has_many :services
  has_many :vendors, through: :invitations
  serialize :services_ids
  validates :name , :presence => true , :uniqueness => true
end