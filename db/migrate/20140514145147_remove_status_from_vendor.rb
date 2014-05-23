class RemoveStatusFromVendor < ActiveRecord::Migration
  def up
    remove_column :vendors, :status
  end

  def down
    add_column :vendors, :status, :boolean, :default => true, :null => false
  end
end
