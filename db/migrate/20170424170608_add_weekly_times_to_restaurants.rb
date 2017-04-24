class AddWeeklyTimesToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :mondayopen, :time
    add_column :restaurants, :mondayclose, :time

    add_column :restaurants, :tuesdayopen, :time
    add_column :restaurants, :tuesdayclose, :time

    add_column :restaurants, :wednesdayopen, :time
    add_column :restaurants, :wednesdayclose, :time

    add_column :restaurants, :thursdayopen, :time
    add_column :restaurants, :thursdayclose, :time

    add_column :restaurants, :fridayopen, :time
    add_column :restaurants, :fridayclose, :time

    add_column :restaurants, :saturdayopen, :time
    add_column :restaurants, :saturdayclose, :time

    add_column :restaurants, :sundayopen, :time
    add_column :restaurants, :sundayclose, :time

    remove_column :restaurants, :opentime, :date
    remove_column :restaurants, :closetime, :date
  end
end
