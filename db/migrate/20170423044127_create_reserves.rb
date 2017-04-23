class CreateReserves < ActiveRecord::Migration[5.0]
  def change
    create_table :reserves do |t|

      t.timestamps
    end
  end
end
