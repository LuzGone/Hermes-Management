class CreateDrivings < ActiveRecord::Migration[7.1]
  def change
    create_table :drivings do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.datetime :data_inicial, null: false, default: Time.now.in_time_zone('America/Sao_Paulo')
      t.datetime :data_final

      t.timestamps
    end
  end
end
