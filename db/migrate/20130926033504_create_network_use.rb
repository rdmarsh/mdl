class CreateNetworkUse < ActiveRecord::Migration
  def change
    create_table :network_uses do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
    add_index :network_uses, :name
  end
end
