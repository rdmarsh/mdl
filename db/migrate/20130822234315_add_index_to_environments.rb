class AddIndexToEnvironments < ActiveRecord::Migration
  def change
    add_index :environments, :environment, unique: true
    
  end
end
