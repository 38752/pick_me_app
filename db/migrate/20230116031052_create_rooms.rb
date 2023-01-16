class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :hit_on,               null: false, foreign_key: true
      t.integer    :room_master_id,       null: false, foreign_key: true
      t.integer    :room_status_index_id, null: false, default: 10
      t.timestamps
    end
  end
end
