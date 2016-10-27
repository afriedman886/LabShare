class Material < ActiveRecord::Base
  has_many :material_details

  validates_presence_of :name
  validates :name, {uniqueness: true}
end