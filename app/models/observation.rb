class Observation < ActiveRecord::Base
  belongs_to :experiment

  validates_presence_of :experiment, :content
end