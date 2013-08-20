class AddServiceAndSupport < ActiveRecord::Migration
  def change
      add_column :organisations, :service_level, :string
      add_column :organisations, :support_level, :string
  end
end
