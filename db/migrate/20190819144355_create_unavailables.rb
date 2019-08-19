class CreateUnavailables < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailables do |t|
      t.references :campsite, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
