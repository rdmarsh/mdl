class MoveServiceLevelToModel < ActiveRecord::Migration
  def change
    remove_column :organisations, :service_reference
    add_column :organisations, :service_level_id, :integer
  end
end
