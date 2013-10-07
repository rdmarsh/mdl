class DropOnemdlSettings < ActiveRecord::Migration
  def change
    drop_table :onemdl_settings
  end
end
