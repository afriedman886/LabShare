class Proposal < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(10) }

  belongs_to :proposer, class_name: :User

  validates_presence_of :name, :hypothesis, :proposer_id

end
