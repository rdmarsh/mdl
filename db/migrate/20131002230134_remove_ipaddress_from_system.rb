class RemoveIpaddressFromSystem < ActiveRecord::Migration
  def change
    remove_column :systems, :ipaddress
  end
end
