class RenameDeviceToSystem < ActiveRecord::Migration
  def change
    rename_table :devices, :systems
  end
end
