class CreateServiceLevels < ActiveRecord::Migration
  def change
    create_table :service_levels do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :service_levels, :name, unique: true
  end
end
