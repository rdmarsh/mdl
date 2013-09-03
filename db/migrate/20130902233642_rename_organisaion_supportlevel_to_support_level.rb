class RenameOrganisaionSupportlevelToSupportLevel < ActiveRecord::Migration
  def change
    rename_column :organisations, :servicelevel, :service_level
    rename_column :organisations, :supportlevel, :support_level
  end
end
