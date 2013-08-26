class AddHoursDaysExclusionsToSupportlevels < ActiveRecord::Migration
  def change
    add_column :supportlevels, :hours, :string
    add_column :supportlevels, :days, :string
    add_column :supportlevels, :exclusions, :string
  end
end
