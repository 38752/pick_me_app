class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.integer :subject_id, null: false, foreign_key: true
      t.integer :object_id,  null: false, foreign_key: true
      t.text    :memo
      t.timestamps
    end
    add_index :memos, [:subject_id, :object_id], unique: true
  end
end
