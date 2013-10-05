class AddSlugToNetworkUses < ActiveRecord::Migration
  def change
    add_column :network_uses, :slug, :string
    add_index :network_uses, :slug
  end
end
