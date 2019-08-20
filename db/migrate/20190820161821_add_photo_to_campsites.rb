class AddPhotoToCampsites < ActiveRecord::Migration[5.2]
  def change
    add_column :campsites, :photo, :string
  end
end
