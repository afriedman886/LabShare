require 'rails_helper'
require 'date'

describe Experiment do
    let(:user) { User.create(fullname: "kyle", email: "kyle@kyle.edu", password: "kyle")}
    let(:proposal) { Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: user.id) }

    let(:experiment_details) {{ proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion"} }

    describe "experiment" do
      it "has an experimenter" do
        experiment = Experiment.create(experiment_details)
        expect(experiment.experimenter).to eq user
      end

      it "has a proposal" do
        experiment = Experiment.create(experiment_details)
        expect(experiment.proposal).to eq proposal
      end

      it "has a materials" do
        experiment = Experiment.create(experiment_details)
        expect(experiment.materials).to eq  "Material A - 2 ; Material B - 3"
      end

      it "has a procedure" do
        experiment = Experiment.create(experiment_details)
        expect(experiment.procedure).to eq "1. thing one ; 2. thing 2"
      end

      it "has a conclusion" do
        experiment = Experiment.create(experiment_details)
        expect(experiment.conclusion).to eq "conclusion"
      end
    end
  end
