require 'rails_helper'
require 'date'

describe Observation do
    let(:user) { User.create(fullname: "kyle", email: "kyle@kyle.edu", password: "kyle")}
    let(:proposal) { Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: user.id) }
    let(:experiment) { Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion") }
    let(:observation_details) { { experiment_id: experiment.id , content: "content"} }

    describe "observation" do
      it "has an experiment" do
        observation = Observation.create(observation_details)
        expect(observation.experiment).to eq experiment
      end

      it "has content" do
        observation = Observation.create(observation_details)
        expect(observation.content).to eq "content"
      end

      it "requires an experimenter to be valid" do
        observation_details.delete(:experiment_id)
        observation = Observation.new(observation_details)
        expect(observation.valid?).to eq false
      end

      it "requires content to be valid" do
        observation_details.delete(:content)
        observation = Observation.new(observation_details)
        expect(observation.valid?).to eq false
      end
    end
  end
