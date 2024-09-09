class Supplier < ApplicationRecord
    has_many :orders

    validates :nome, presence: {message: "Campo Obrigatório"} 
end
