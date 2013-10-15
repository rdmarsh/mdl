class AddNameAndDescToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :description, :text
    add_column :addresses, :name, :string
    add_column :addresses, :slug, :string
    add_index :addresses, :slug
  end
end
