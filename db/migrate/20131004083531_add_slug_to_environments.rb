class AddSlugToEnvironments < ActiveRecord::Migration
  def change
    add_column :environments, :slug, :string
    add_index :environments, :slug
  end
end
