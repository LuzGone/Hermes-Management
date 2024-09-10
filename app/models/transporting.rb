class Transporting < ApplicationRecord
  belongs_to :order
  belongs_to :vehicle

  validates :origem, presence: {message: "Campo Obrigatório"}
  validates :destino, presence: {message: "Campo Obrigatório"}
end
