class AddSlugToSupportLevels < ActiveRecord::Migration
  def change
    add_column :support_levels, :slug, :string
    add_index :support_levels, :slug
  end
end
