class Experiment < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :experimenter, class_name: :User

end
