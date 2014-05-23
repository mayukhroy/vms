class AddStatusToProject < ActiveRecord::Migration
  def change
    add_column :projects, :status, :boolean, :default => true, :null => false
  end
end
