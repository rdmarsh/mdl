class ChangeSupportLevelToLevel < ActiveRecord::Migration
  def change
    rename_column :organisations, :service_level, :service_reference
    rename_column :organisations, :support_level, :support_reference
    rename_column :organisations, :reference, :organisation_reference
    rename_column :support_levels, :support_level, :support_reference
  end
end
