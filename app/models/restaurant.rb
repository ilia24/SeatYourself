class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews
  has_many :timeslots
  validates :name, :opentime, :closetime, :capacity, presence: true

end
