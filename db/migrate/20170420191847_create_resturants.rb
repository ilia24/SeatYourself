class CreateResturants < ActiveRecord::Migration[5.0]
  def change
    create_table :resturants do |t|
      t.string :name
      t.time :opentime
      t.time :closetime

      t.timestamps
    end
  end
end
