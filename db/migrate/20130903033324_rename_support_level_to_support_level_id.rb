class RenameSupportLevelToSupportLevelId < ActiveRecord::Migration
  def change
    rename_column :organisations, :support_level, :support_level_id
  end
end
