class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :resturant_id
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
