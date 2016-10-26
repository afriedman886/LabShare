class Proposal < ActiveRecord::Base
  validates_presence_of :name, :hypothesis, :proposer_id
end
