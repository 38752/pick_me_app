class CreateHitOns < ActiveRecord::Migration[6.0]
  def change
    create_table :hit_ons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hima, null: false, foreign_key: true
      t.text       :line, null: false
      t.timestamps
    end
    add_index :hit_ons, [:user_id, :hima_id], unique: true
  end
end
