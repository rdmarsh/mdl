class ChangeOrgRelationshipToInt < ActiveRecord::Migration
  def change
    remove_column :organisations, :relationship
    add_column :organisations, :relationship_id, :integer
  end
end
