class ChangeLevelToSupportLevel < ActiveRecord::Migration
  def change
    rename_column :support_levels, :level, :support_level
  end
end
