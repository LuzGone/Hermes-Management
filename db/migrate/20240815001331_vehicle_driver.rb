class VehicleDriver < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles_drivers do |t|
      t.belongs_to :vehicle
      t.belongs_to :driver
    end
  end
end
