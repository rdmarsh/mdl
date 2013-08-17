class AddServiceAndSupport < ActiveRecord::Migration
  def change
      add_column :organisations, :service, :string
      add_column :organisations, :support, :string
  end
end
