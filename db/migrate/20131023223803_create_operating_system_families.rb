class CreateOperatingSystemFamilies < ActiveRecord::Migration
  def change
    create_table :operating_system_families do |t|
      t.string :slug
      t.string :name
      t.text :description
      
      t.timestamps
    end
    add_index :operating_system_families, :name
    add_index :operating_system_families, :slug
  end
end
