class AddIndexToOrgRef < ActiveRecord::Migration
  def change
    add_index :organisations, :reference, unique: true
  end
end
