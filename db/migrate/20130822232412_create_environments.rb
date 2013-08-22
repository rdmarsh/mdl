class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :environment
      t.text :description

      t.timestamps
    end
  end
end
