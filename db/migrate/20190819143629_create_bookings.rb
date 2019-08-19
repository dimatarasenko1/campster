class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :campsite, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.integer :guests
      t.float :total_price

      t.timestamps
    end
  end
end
