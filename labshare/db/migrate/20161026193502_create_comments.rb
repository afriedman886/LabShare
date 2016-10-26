class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, :commentable_type
      t.intger :commenter_id, :commentable_id


      t.timestamps(null: false)
    end
  end
end
