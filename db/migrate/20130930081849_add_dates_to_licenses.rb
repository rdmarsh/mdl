class AddDatesToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :key, :string
    add_column :licenses, :start_at, :date
    add_column :licenses, :end_at, :date
  end
end
