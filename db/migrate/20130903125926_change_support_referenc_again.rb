class ChangeSupportReferencAgain < ActiveRecord::Migration
  def change
    rename_column :support_levels, :support_reference, :name
  end
end
