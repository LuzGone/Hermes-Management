class Vehicle < ApplicationRecord
    has_many :payloads
    has_many :orders, through: :payloads
end
