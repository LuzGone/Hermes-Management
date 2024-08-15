class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :placa
      t.string :modelo

      t.timestamps
    end
  end
end
