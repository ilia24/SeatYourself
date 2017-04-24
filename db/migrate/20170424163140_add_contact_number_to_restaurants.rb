class AddContactNumberToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :contact_number, :string
  end
end
