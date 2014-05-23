class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :vendor_id
      t.integer :user_id
      t.string :services_ids
      t.string :name
      t.boolean :status, :default => false, :null => false

      t.timestamps
    end
  end
end
