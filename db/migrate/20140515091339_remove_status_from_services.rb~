class RemoveStatusFromServices < ActiveRecord::Migration
  def up
    remove_column :services, :status
  end

  def down
    add_column :services, :status, :string
  end
end
