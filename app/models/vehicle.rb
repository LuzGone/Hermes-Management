class Vehicle < ApplicationRecord
    has_many :transporting
    has_many :orders, through: :transporting

    has_many :driving
    has_many :drivers, through: :driving
end
