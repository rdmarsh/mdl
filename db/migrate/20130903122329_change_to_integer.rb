class ChangeToInteger < ActiveRecord::Migration
  def change
    change_column :organisations, :support_level_id, :integer
  end
end
