class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.integer :experimenter_id, :proposal_id
      t.string :status, :procedures, :conclusion

      t.timestamps(null: false)
    end
  end
end
