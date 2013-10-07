class AddDescriptionToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :description, :text
  end
end
