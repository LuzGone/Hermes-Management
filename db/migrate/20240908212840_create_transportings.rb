class CreateTransportings < ActiveRecord::Migration[7.1]
  def change
    create_table :transportings do |t|
      t.string :origem
      t.string :destino
      
      t.datetime :dataDespache, null:false, default: Time.now
      t.datetime :dataEntrega

      t.references :order, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
