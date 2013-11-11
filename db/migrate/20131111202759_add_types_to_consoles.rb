class AddTypesToConsoles < ActiveRecord::Migration
  def change
    add_column :consoles, :type, :string
  end
end
