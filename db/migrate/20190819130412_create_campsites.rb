class CreateCampsites < ActiveRecord::Migration[5.2]
  def change
    create_table :campsites do |t|
      t.string :title
      t.text :description
      t.integer :price_per_night
      t.string :amenities
      t.datetime :check_in
      t.datetime :check_out
      t.integer :min_nights
      t.string :address
      t.string :postcode
      t.string :city
      t.string :county
      t.string :country
      t.integer :max_guests

      t.timestamps
    end
  end
end
