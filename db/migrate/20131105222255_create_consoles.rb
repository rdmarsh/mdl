class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :consoles, :name
  end
end
