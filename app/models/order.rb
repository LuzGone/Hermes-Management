class Order < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["codigo_rastreio", "created_at", "danfe", "data_fornecimento", "endereco_entrega", "id", "nfe", "status_pedido", "supplier_id", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
        ["supplier", "transporting", "vehicles"]
    end
    
    belongs_to :supplier
    has_many :transporting
    has_many :vehicles, through: :transporting

    validates :danfe, presence: {message: "Campo Obrigatório"}, uniqueness: {message: "Já Foi Utilizado"}, length: {is:44, message: "Precisa ter Exatamente 44 dígitos"}, numericality: {only_integer: true, message:"Apenas números são permitidos"} 
    validates :nfe, presence: {message: "Campo Obrigatório"}, uniqueness: {message: "Já Foi Utilizado"}, length: {is:9, message: "Precisa ter Exatamente 9 dígitos"}, numericality: {only_integer: true, message:"Apenas números são permitidos"}
    validates :codigo_rastreio, presence: {message: "Campo Obrigatório"}, uniqueness: {message: "Já Foi Utilizado"}, length: {is:11, message: "Precisa ter Exatamente 11 dígitos"}, numericality: {only_integer: true, message:"Apenas números são permitidos"}
    validates :endereco_entrega, presence: {message: "Campo Obrigatório"} 

    
end
