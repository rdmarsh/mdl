class AddoperatingSystemIdToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :operating_system_id, :integer
    add_index :systems, :operating_system_id
  end
end
