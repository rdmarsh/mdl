class RenameReferenceToName < ActiveRecord::Migration
  def change
    rename_column :organisations, :name, :full_name
    rename_column :organisations, :reference, :name
  end
end
