class CreateDrivings < ActiveRecord::Migration[7.1]
  def change
    create_table :drivings do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.datetime :dataInicial, null: false, default: Time.now
      t.datetime :dataFinal

      t.timestamps
    end
  end
end
