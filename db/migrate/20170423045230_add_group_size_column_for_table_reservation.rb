class AddGroupSizeColumnForTableReservation < ActiveRecord::Migration[5.0]
  def change
        add_column :reservations, :group_size, :integer
  end
end
