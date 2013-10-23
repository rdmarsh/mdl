class RemoveTimeZoneFromAddress < ActiveRecord::Migration
  def change
    remove_column :addresses, :time_zone
  end
end
