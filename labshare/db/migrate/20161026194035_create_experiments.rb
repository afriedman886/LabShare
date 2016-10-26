class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.integer :experimenter_id, :proposal_id, null: false
      t.text :procedures, :conclusion
      t.string :status, defualt: "Open"

      t.timestamps(null: false)
    end
  end
end
