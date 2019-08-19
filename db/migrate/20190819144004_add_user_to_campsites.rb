class AddUserToCampsites < ActiveRecord::Migration[5.2]
  def change
    add_reference :campsites, :user, foreign_key: true
  end
end
