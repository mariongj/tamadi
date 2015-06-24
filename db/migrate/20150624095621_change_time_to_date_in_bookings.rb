class ChangeTimeToDateInBookings < ActiveRecord::Migration
  def change
    rename_column :bookings, :start_time, :start_date
    rename_column :bookings, :end_time, :end_date
  end
end
