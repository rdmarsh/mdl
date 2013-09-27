class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :quantity
      
      t.references :license_type
      
      t.timestamps
    end
    add_index :licenses, :license_type_id
  end
end
