class AddSlugToOperatingSystems < ActiveRecord::Migration
  def change
    add_column :operating_systems, :slug, :string
    add_index :operating_systems, :slug
  end
end
