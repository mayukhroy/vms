class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 
has_many :vendors , :dependent => :destroy
has_many :projects , :dependent => :destroy
has_many :invitations
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :name, :contact_number, :remember_me, :role
  # attr_accessible :title, :body
  validates :name, length: { in: 4..20 }
  validates :contact_number, length: { in: 0..10 },numericality: { only_integer: true }
  
end
# :confirmable
