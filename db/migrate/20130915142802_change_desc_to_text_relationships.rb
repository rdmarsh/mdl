class ChangeDescToTextRelationships < ActiveRecord::Migration
  def change
    change_column :relationships, :description, :text
  end
end
