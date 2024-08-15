class OrderVehicle < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_vehicles do |t|
      t.belongs_to :order
      t.belongs_to :vehicle
    end
  end
end
