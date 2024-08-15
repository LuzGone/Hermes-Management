json.extract! order, :id, :danfe, :nfe, :nome_cliente, :cpf_cliente, :endereco_cliente, :status_pedido, :nome_fornecedor, :created_at, :updated_at
json.url order_url(order, format: :json)
