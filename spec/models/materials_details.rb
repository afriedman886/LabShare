require 'rails_helper'

describe MaterialsDetails do
  describe "creating a materials detail" do
    let(:material) {Material.create( name: "people" )}

    it 'create a new materials detail with a material, experiment, and quantity' do
      materials_detail = MaterialDetail.create(material: material, quantity:2, experiment_id: 1)
      expect(materials_detail.material).to eq material
      expect(materials_detail.quantity).to eq 1
      expect(materials_detail.experiment_id).to eq 1
    end

    it 'cannot create a new material without a material' do
      materials_detail = MaterialDetail.new(experiment_id: 1)
      expect(materials_detail.valid?).to eq false
    end

    it 'cannot create a new material without an experiment' do
      materials_detail = MaterialDetail.new(material: material, quantity:2)
      expect(materials_detail.valid?).to eq false
    end

    it 'defaults the quantity to 1' do
      materials_detail = MaterialDetail.create(material: material, experiment_id: 1)
      expect(materials_detail.valid?).to eq false
    end

    it 'allows an experiment to only list a certain material once' do
      materials_detail = MaterialDetail.create(material: material, experiment_id: 1)
      materials_detail = MaterialDetail.new(material: material, experiment_id: 1)
      expect(materials_detail.valid?).to eq false
    end
  end
end