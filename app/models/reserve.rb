class Reserve < ApplicationRecord
  belongs_to :timeslots
  belongs_to :reservations
end
