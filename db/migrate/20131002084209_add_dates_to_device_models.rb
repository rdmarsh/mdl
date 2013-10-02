class AddDatesToDeviceModels < ActiveRecord::Migration
  def change
    add_column :device_models, :end_of_sale, :date
    add_column :device_models, :end_of_support, :date
  end
end
