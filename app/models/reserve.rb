class Reserve < ApplicationRecord
  belongs_to :timeslot
  belongs_to :reservation
end
