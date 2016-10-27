class Proposal < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(10) }

  has_many :comments, as: :commentable
  belongs_to :proposer, class_name: :User, foreign_key: :proposer_id
  has_many :experiments

  validates_presence_of :name, :hypothesis, :proposer_id

end
