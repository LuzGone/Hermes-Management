class Driver < ApplicationRecord
    has_many :driving
    has_many :vehicles, through: :driving

    validates :nome, presence: {message: "Campo Obrigatório"}
    validates :matricula, presence: {message: "Campo Obrigatório"}, uniqueness: {message: "Já Foi Utilizado"}, length: {is:12, message: "Precisa ter Exatamente 12 dígitos"}, numericality: {only_integer: true, message:"Apenas números são permitidos"}
    validates :endereco, presence: {message: "Campo Obrigatório"}
    validates :telefone, presence: {message: "Campo Obrigatório"}
    validates :login, presence: {message: "Campo Obrigatório"}, uniqueness: {message: "Já Foi Utilizado"}
    validates :senha, presence: {message: "Campo Obrigatório"}
end
