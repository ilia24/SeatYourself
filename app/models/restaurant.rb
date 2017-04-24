class Restaurant < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews
  has_many :timeslots
  validates :name, :opentime, :closetime, :capacity, presence: true



#to convert the price range from numbers to $$$$ signs
  def self.price_range_conversion(id)
    @restaurant = Restaurant.find(id)

    case @restaurant.price_range.to_i
    when 1

        @dollars = "$"
        @range = "20 and under"
        return @dollars, @range

    when 2
        @dollars = "$$"
        @range = "30 and under"
        return @dollars, @range

    when 3
          @dollars = "$$$"
          @range = "31 - 50"
          return @dollars, @range

      when 4
            @dollars = "$$$$"
            @range = "51 - 100 "
            return @dollars, @range

      when 5
              @dollars = "$$$$$"
              @range = "101 and over"
              return @dollars, @range

end

end



end
