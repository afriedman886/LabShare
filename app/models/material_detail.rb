class MaterialDetail < ActiveRecord::Base
  belongs_to :material
  belongs_to :experiment

  validates_presence_of :experiment, :material
  validates_uniqueness_of :material, scope: :experiment
end