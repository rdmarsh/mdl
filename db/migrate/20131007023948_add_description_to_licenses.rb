class AddDescriptionToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :description, :text
  end
end
