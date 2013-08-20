class CreateSupportlevels < ActiveRecord::Migration
  def change
    create_table :supportlevels do |t|
      t.string :supportlevel
      t.text :supportdescription

      t.timestamps
    end
    add_index :supportlevels, :supportlevel, unique: true
  end
end
