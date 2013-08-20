class AddActiveToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :active, :boolean
  end
end
