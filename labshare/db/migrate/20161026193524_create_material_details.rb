class CreateMaterialDetails < ActiveRecord::Migration
  def change
    create_table :material_details do |t|
      t.integer :material_id, :experiment_id
      t.integer :quantity, default: 1


      t.timestamps(null: false)
    end
  end
end
