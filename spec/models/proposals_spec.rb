require 'rails_helper'
require 'date'

describe Proposal do
  let(:proposal) { Proposal.new }
  proposal_details = {name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: 2}

  describe ".recent" do
    context "displays the recent proposals, max of 10" do
      it "displays 10 recent proposals" do
        15.times { Proposal.create(proposal_details) }
        expect(Proposal.recent.length).to be <= 10
      end
    end
  end

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
      expect(proposal.status).to eq "Open"
    end

    it "has a proposer" do
      proposal = Proposal.create(proposal_details)
      expect(proposal.proposer_id).to eq 2
    end
  end
end
