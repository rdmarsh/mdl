class CreateLicenseTypes < ActiveRecord::Migration
  def change
    create_table :license_types do |t|
      t.string :name
      t.text :description
      
      t.references :organisation
      
      t.timestamps
    end
    add_index :license_types, :name, unique: true
    add_index :license_types, :organisation_id
  end
end
