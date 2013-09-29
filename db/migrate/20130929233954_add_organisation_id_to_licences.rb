class AddOrganisationIdToLicences < ActiveRecord::Migration
  def change
    add_column :licenses, :organisation_id, :integer
    
    add_index :licenses, :organisation_id
  end
end
