class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :reference

      t.timestamps
    end
  end
end
