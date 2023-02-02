class CreateIndividualActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :individual_activities do |t|
      t.references :room,      null: false,     foreign_key: true
      t.integer    :object_id, null: false,     foreign_key: true
      t.string     :category,  null: false
      t.boolean    :read,      null: false, default: false

      t.timestamps
    end
  end
end
