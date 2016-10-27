require 'rails_helper'

describe Material do

  describe "creating a material" do
    it 'create a new material with a name' do
      material = Material.create( name: "people" )
      expect(material.name).to eq "people"
    end

    it 'cannot create a new material without a name' do
      material = Material.new()
      expect(material.valid?).to eq false
    end

    it 'does not allow materials with duplicate names' do
      Material.create( name: "people" )
      material = Material.new( name: "people" )
      expect(material.valid?).to eq false
    end
  end
end