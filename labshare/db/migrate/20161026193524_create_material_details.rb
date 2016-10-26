class CreateMaterialDetails < ActiveRecord::Migration
  def change
    create_table :material_details do |t|
      t.integer :material_id, :experiment_id, :quantity


      t.timestamps(null: false)
    end
  end
end
