class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :relationships, :name, unique: true
  end
end
