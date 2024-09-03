class Payload < ApplicationRecord
    belongs_to :order
    belongs_to :vehicle
end
