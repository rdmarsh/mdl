class AddIndexToAddresses < ActiveRecord::Migration
  def change
    add_index :addresses, :organisation_id
  end
end
