class CreateSeat < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.integer :seat_number
      t.integer :booking_id
      t.integer :screening_id

      t.timestamps
    end
    add_index :seats, :booking_id
  end
end
