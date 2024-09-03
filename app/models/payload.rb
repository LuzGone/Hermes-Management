class Payload < ApplicationRecord
    belongs_to :orders
    belongs_to :vehicles
end
