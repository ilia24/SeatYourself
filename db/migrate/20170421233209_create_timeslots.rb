class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.date :start
      t.date :end
      t.integer :cap
      t.integer :people

      t.timestamps
    end
  end
end
