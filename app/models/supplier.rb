class Supplier < ApplicationRecord
    has_many :orders

    validates :nome, presence: {message: "Campo Obrigatório"} 

    def self.ransackable_attributes(auth_object = nil)
        ["nome"]
    end
end
