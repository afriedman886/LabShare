class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.integer :experimenter_id, :proposal_id, null: false
      t.text :procedure, :materials, :conclusion
      t.string :status, default: "Open"

      t.timestamps(null: false)
    end
  end
end
