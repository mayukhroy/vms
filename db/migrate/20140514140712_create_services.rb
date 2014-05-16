class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :vendor_id
      t.string :name

      t.timestamps
    end
  end
end
