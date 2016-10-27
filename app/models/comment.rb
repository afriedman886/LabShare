class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: "User", foreign_key: :commenter_id


  validates_presence_of :commentable, :content, :commenter
end

