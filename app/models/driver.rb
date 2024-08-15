class Driver < ApplicationRecord
    has_and_belongs_to_many :vehicles
end
