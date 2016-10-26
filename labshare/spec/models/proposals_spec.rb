require 'rails_helper'
require 'date'

describe Proposal do
  let(:proposal) { Proposal.new }
  proposal_details = {name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), status: "open", proposer_id: 2}

  describe "proposal" do
    it "has a name" do
      proposal = Proposal.create(proposal_details)
      expect(proposal.name).to eq "Proposal 1"
    end

    it "has a hypothesis" do
      proposal = Proposal.create(proposal_details)
      expect(proposal.hypothesis).to eq "It figures stuff out"
    end

    it "has a completion date" do
      proposal = Proposal.create(proposal_details)
      expect(proposal.target_completion_date).to be_a(Date)
    end

    it "has a status" do
      proposal = Proposal.create(proposal_details)
      expect(proposal.status).to eq "open"
    end

    it "has a proposer" do
      proposal = Proposal.create(proposal_details)
      expect(proposal.proposer_id).to eq 2
    end
  end
end
