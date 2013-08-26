class CreateSupportlevels < ActiveRecord::Migration
  def change
    create_table :supportlevels do |t|
      t.string :level
      t.text :description

      t.timestamps
    end
    add_index :supportlevels, :level, unique: true
  end
end
