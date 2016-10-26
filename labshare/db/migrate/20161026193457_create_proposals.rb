class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :proposer_id
      t.string :name, :hypothesis
      t.date :target_completion_date

      t.timestamps(null: false)
    end
  end
end
