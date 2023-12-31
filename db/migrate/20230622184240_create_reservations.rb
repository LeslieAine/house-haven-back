class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :city
      t.date :start_date
      t.date :end_date
      t.references :house, null: false, foreign_key: { to_table: :houses }

      t.timestamps
    end
  end
end
