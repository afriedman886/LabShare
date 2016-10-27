class Experiment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :experimenter, class_name: :User, foreign_key: :experimenter_id

  validates_presence_of :experimenter, :proposal

end
