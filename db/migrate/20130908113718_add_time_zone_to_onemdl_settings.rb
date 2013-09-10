class AddTimeZoneToOnemdlSettings < ActiveRecord::Migration
  def change
    add_column :onemdl_settings, :time_zone, :string
  end
end
