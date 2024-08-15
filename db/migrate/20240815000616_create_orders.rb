class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :danfe
      t.string :nfe
      t.string :nome_cliente
      t.string :cpf_cliente
      t.string :endereco_cliente
      t.string :status_pedido
      t.string :nome_fornecedor

      t.timestamps
    end
  end
end
