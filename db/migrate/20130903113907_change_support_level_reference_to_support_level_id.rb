class ChangeSupportLevelReferenceToSupportLevelId < ActiveRecord::Migration
  def change
    rename_column :organisations, :support_reference, :support_level_id
    
  end
end
