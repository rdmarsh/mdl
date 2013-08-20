class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :organisations, :service_level, :servicelevel
    rename_column :organisations, :support_level, :supportlevel
  end
end
