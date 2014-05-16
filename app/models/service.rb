class Service < ActiveRecord::Base
  attr_accessible :name, :vendor_id
  belongs_to :vendor
  belongs_to :project
end
