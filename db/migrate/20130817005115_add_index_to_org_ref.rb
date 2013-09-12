class AddIndexToOrgRef < ActiveRecord::Migration
  def change
    remove_column :organisations, :service_reference
    add_index :organisations, :reference, unique: true
  end
end
