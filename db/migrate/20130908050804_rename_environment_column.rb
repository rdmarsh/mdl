class RenameEnvironmentColumn < ActiveRecord::Migration
  def change
    rename_column :environments, :environment, :name
  end
end
