class AddTypesToConsoles < ActiveRecord::Migration
  def change
    add_column :consoles, :console_type, :string
  end
end
