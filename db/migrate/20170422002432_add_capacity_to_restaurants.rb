class AddCapacityToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :capacity, :integer
  end
end
