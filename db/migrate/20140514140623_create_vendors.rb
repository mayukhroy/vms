class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :contact_no
      t.string :address

      t.timestamps
    end
  end
end
