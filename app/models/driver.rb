class Driver < ApplicationRecord
    has_many :driving
    has_many :vehicles, through: :driving
end
