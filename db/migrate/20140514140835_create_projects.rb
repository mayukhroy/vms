class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :vendor_id
      t.integer :user_id
      t.string :services_ids
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
