class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :subject_id , null: false, foreign_key: true
      t.integer :object_id  , null: false, foreign_key: true
      t.timestamps
    end
    add_index :relationships, [:subject_id, :object_id], unique: true
  end
end
