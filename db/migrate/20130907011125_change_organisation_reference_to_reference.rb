class ChangeOrganisationReferenceToReference < ActiveRecord::Migration
  def change
    rename_column :organisations, :organisation_reference, :reference
  end
end
