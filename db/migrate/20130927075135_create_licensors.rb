class CreateLicensors < ActiveRecord::Migration
  def change
    create_table :licensors do |t|
      
      t.references :organisation
      t.string :website
      t.text :description
      
      t.timestamps
    end
    add_index :licensors, :organisation_id, unique: true
  end
end
