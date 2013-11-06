class AddSlugToConsoles < ActiveRecord::Migration
  def change
    add_column :consoles, :slug, :string
    add_index :consoles, :slug
  end
end
