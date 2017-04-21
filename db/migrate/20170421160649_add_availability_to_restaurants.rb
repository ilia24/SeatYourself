class AddAvailabilityToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :availability, :string
  end
end
