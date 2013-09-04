class DestroyConfigurationsModel < ActiveRecord::Migration
  def change
    drop_table :configurations
  end
end
