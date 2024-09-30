class CreateTransportings < ActiveRecord::Migration[7.1]
  def change
    create_table :transportings do |t|
      t.string :origem
      t.string :destino
      
      t.datetime :data_despache, null:false, default: Time.now.in_time_zone('America/Sao_Paulo')
      t.datetime :data_entrega

      t.references :order, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
