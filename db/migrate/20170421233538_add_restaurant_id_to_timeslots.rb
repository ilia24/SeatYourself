class AddRestaurantIdToTimeslots < ActiveRecord::Migration[5.0]
  def change
    add_column :timeslots, :restaurant_id, :integer
  end
end
