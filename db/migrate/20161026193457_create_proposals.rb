class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :proposer_id, null: false
      t.string :name, null: false
      t.text :hypothesis, null: false
      t.date :target_completion_date
      t.string :status, default: "Open"

      t.timestamps(null: false)
    end
  end
end
