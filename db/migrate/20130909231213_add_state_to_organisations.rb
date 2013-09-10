class AddStateToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :state, :string
  end
end
