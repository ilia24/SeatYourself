class AddCuisineToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :cuisine, :string
  end
end
