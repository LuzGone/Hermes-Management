class CreateDrivings < ActiveRecord::Migration[7.1]
  def change
    create_table :drivings do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
