class AddDatesToOperatingSystems < ActiveRecord::Migration
  def change
    add_column :operating_systems, :release_date, :date
    add_column :operating_systems, :end_of_support, :date
  end
end
