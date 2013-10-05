class AddSlugToLicenseTypes < ActiveRecord::Migration
  def change
    add_column :license_types, :slug, :string
    add_index :license_types, :slug
  end
end
