class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.integer :experiment_id, null: false
      t.text :content, null: false

      t.timestamps(null: false)
    end
  end
end
