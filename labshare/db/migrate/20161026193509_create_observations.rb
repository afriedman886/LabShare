class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.integer :experiment_id
      t.string :content

      t.timestamps(null: false)
    end
  end
end
