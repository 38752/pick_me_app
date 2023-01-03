class CreateHimas < ActiveRecord::Migration[6.0]
  def change
    create_table :himas do |t|
      t.references :user,          null: false, foreign_key: true
      t.string     :title,         null: false
      t.string     :location
      t.text       :text,          null: false
      t.integer    :open_range_id, null: false
      t.timestamps
    end
  end
end
