class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :flat, index: true, foreign_key: true
      t.integer :nb_travelers
      t.string :start_time
      t.string :end_time
      t.text :message
      t.string :status

      t.timestamps null: false
    end
  end
end
