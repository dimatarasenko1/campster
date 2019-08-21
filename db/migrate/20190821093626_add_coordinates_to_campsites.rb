class AddCoordinatesToCampsites < ActiveRecord::Migration[5.2]
  def change
    add_column :campsites, :latitude, :float
    add_column :campsites, :longitude, :float
  end
end
