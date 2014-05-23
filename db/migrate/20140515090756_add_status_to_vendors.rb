class AddStatusToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :status, :boolean, :default => true, :null => false
  end
end
