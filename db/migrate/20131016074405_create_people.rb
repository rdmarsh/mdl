class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :slug
      t.references :organisation
      
      t.timestamps
    end
    add_index :people, :name
    add_index :people, :slug
  end
end
