class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :danfe
      t.string :nfe
      t.string :endereco_entrega
      t.string :status_pedido, default: "PENDENTE"
      t.string :codigo_rastreio
      
      t.datetime :data_fornecimento, null: false
      
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
