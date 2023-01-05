class CreateHimaPurposes < ActiveRecord::Migration[6.0]
  def change
    create_table :hima_purposes do |t|
      t.references :hima,       null: false, foreign_key: true
      t.integer    :purpose_id
      t.integer    :flag
      t.timestamps
    end
  end
end
