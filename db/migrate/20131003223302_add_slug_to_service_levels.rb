class AddSlugToServiceLevels < ActiveRecord::Migration
  def change
    add_column :service_levels, :slug, :string
    add_index :service_levels, :slug
  end
end
