class ChangeDescToTextManufacturers < ActiveRecord::Migration
  def change
    change_column :manufacturers, :description, :text
  end
end
