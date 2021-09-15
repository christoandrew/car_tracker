class Car < ApplicationRecord
  has_many :car_positions
  validates_presence_of :model
  validates_uniqueness_of :model

end
