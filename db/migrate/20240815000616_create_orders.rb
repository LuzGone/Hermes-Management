class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :danfe
      t.string :nfe
      t.string :endereco_entrega
      t.string :status_pedido
      t.string :nome_fornecedor

      t.timestamps
    end
  end
end
