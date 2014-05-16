class AddStatusToServices < ActiveRecord::Migration
  def change
    add_column :services, :status, :boolean, :default => true
  end
end
