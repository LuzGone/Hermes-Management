class Order < ApplicationRecord
    has_many :payloads
    has_many :vehicles, through: :payloads
end
