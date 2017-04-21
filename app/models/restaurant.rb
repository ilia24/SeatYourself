class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews


  def pack(opentime, closetime)
    @availability = {}
    oneopen = opentime.strftime("%H_%M")
    oneclose = closetime.strftime("%H_%M")
    @availability[:dayavail] = "#{oneopen}-#{oneclose}"
    
    #hidden code for future expansion to full week, inputs are mo/mc
    # mondayopen = mo.strftime("%H_%M")
    # mondayclose = mc.strftime("%H_%M")
    # @availability[:monday] = "#{mondayopen}-#{mondayclose}"
  end
end
