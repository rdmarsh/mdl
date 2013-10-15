class AddOrgIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :organisation_id, :integer
  end
end
