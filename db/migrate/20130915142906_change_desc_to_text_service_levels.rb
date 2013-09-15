class ChangeDescToTextServiceLevels < ActiveRecord::Migration
  def change
    change_column :service_levels, :description, :text
    
  end
end
