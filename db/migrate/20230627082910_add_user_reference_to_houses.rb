class AddUserReferenceToHouses < ActiveRecord::Migration[7.0]
  def change
    add_reference :houses, :user, null: false, foreign_key: { to_table: :users }
  end
end
