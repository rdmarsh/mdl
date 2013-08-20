class AddRelationshipToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :relationship, :string
  end
end
