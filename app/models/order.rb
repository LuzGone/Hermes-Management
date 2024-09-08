class Order < ApplicationRecord
    belongs_to :supplier
    has_many :transporting
    has_many :vehicles, through: :transporting
end
