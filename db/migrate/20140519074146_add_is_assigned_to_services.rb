class AddIsAssignedToServices < ActiveRecord::Migration
  def change
    add_column :services, :is_assigned, :boolean, :default => false, :null => false
  end
end
