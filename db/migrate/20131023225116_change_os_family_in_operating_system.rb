class ChangeOsFamilyInOperatingSystem < ActiveRecord::Migration
  def change
    remove_column :operating_systems, :family
    add_column :operating_systems, :operating_system_family_id, :integer
  end
end
