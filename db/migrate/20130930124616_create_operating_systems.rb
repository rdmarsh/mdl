class CreateOperatingSystems < ActiveRecord::Migration
  def change
    create_table :operating_systems do |t|
      t.string :name
      t.string :release
      t.string :family
      t.text :description
      t.references :organisation

      t.timestamps
    end
    add_index :operating_systems, :name, unique: true
    add_index :operating_systems, :organisation_id
  end
end
