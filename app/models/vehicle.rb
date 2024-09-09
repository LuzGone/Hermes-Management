class Vehicle < ApplicationRecord
    has_many :transporting
    has_many :orders, through: :transporting

    has_many :driving
    has_many :drivers, through: :driving

    validates :modelo, presence: {message: "Campo Obrigatório"}
    validates :placa, presence: {message: "Campo Obrigatório"}, uniqueness: {message: "Já Foi Utilizado"}, length: {is:7, message: "Precisa ter Exatamente 7 dígitos"}
    
end
