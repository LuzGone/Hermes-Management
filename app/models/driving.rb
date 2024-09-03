class Driving < ApplicationRecord
  belongs_to :driver
  belongs_to :vehicle
end
