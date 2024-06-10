class AddUserToGifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :gifts, :user, null: false, foreign_key: true
  end
end
