class Vehicle < ApplicationRecord
    has_many :payloads
    has_many :orders, through: :payloads

    has_many :driving
    has_many :drivers, through: :driving
end
