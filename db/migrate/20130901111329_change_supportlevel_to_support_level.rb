class ChangeSupportlevelToSupportLevel < ActiveRecord::Migration
  def change
    rename_table :supportlevels, :support_levels
  end
end
