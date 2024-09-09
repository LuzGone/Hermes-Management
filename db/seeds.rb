# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
=begin
for i in 1..100
    Order.create!(
        danfe: Faker::Number.number(9),
        nfe: Faker::Number.number(44),
        nome_cliente: Faker::Name.unique.name,
        cpf_cliente: Faker::Number.number(11),
        endereco_cliente: Faker::Address.full_address,
        status_pedido: ['Pendente','A Caminho','Recebido'].sample,
        nome_fornecedor: Faker::Company.name,
    )
end

for i in 1..20
    nomeCompleto = Faker::Name.unique.name 
    Driver.create!(
        nome: nomeCompleto,
        matricula: Faker::Number.number(9),
        endereco: Faker::Address.full_address,
        telefone: Faker::Number.number(11),
        login: nomeCompleto.split[0],
        senha: nomeCompleto.split[0]
    )
end

for i in 1..40
    Vehicle.create!(
        placa: Faker::Vehicle.model,
        modelo: Faker::Vehicle.license_plate
    )
end

for i in 1..10
    nomeCompleto = Faker::Name.unique.name 
    User.create!(
        nome: nomeCompleto,
        matricula: Faker::Number.number(9),
        login: nomeCompleto.split[0],
        senha: nomeCompleto.split[0]
    )
end
=end

fornecedores = []
for i in 1..10
    fornecedor = Supplier.create!(
        nome: "Fornecedora #{i}"
    )
    fornecedores.push(fornecedor)
end

for i in 1..200
    Order.create!(
        nfe: "#{(rand(0.1..1)*10**9).to_i}",
        danfe: "#{(rand(0.1..1)*10**44).to_i}",
        endereco_entrega: "Endereco Entrega #{i}",
        status_pedido: "PENDENTE", #['PENDENTE','A CAMINHO','ENTREGUE'].sample
        supplier_id: fornecedores.sample.id
    )
end

listaDeDDD = [11, 12, 13, 14, 15, 16, 17, 18, 19 , 21, 22, 24 ,31, 32, 33, 34, 35, 37, 38, 27, 28, 41, 42, 43, 44, 45, 46, 51, 53, 54, 55, 47, 48, 49, 68, 96, 92, 97, 91, 93, 94, 69, 95, 63, 82, 71, 73, 74, 75, 77, 85, 88, 98, 99, 83, 81, 87, 86, 89, 84, 79, 61, 62, 64, 65, 66, 67]

for i in 1..20
    Driver.create!(
        nome: "Motorista #{i}",
        matricula: "#{(rand(0.1..1)*10**11).to_i}",
        endereco: "Endereco Motorista #{i}",
        telefone: "(#{listaDeDDD.sample})9""#{(rand(0.1..1)*10**8).to_i}",
        situacao: "INATIVO",
        login: "motorista#{i}",
        senha: "motorista#{i}"
    )
end

for i in 1..40
    Vehicle.create!(
        placa: "#{(rand(0.1..1)*10**6).to_i}",
        modelo: "Modelo #{i}",
        situacao: "INATIVO",
    )
end

for i in 1..10
    User.create!(
        nome: "Usuario #{i}",
        matricula: "#{(rand(0.1..1)*10**11).to_i}",
        login: "usuario#{i}",
        senha: "usuario#{i}"
    )
end

Admin.create!(
    login: 'admin',
    senha: 'admin'
)