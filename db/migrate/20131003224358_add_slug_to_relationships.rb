class AddSlugToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :slug, :string
    add_index :relationships, :slug
  end
end
