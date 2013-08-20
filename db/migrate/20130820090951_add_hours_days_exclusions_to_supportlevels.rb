class AddHoursDaysExclusionsToSupportlevels < ActiveRecord::Migration
  def change
    add_column :supportlevels, :supporthours, :string
    add_column :supportlevels, :supportdays, :string
    add_column :supportlevels, :supportexclusions, :string
  end
end
