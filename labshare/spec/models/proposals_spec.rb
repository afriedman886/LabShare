require 'rails_helper'
require 'date'

describe Proposal do
  let(:proposal) { Proposal.new }

  describe "proposal" do
    it "has a name" do
      proposal = Proposal.create(name: "Proposal 1", hypothesis: "It gets figures stuff out", completion_date: Date.new(2016,10,03), status: "open", proposer: 2)
      expect(proposal.name).to eq "Proposal 1"
    end

    it "has a hypothesis" do
    end

    it "has a completion date" do
    end

    it "has a status" do
    end

    it "has a proposer" do
    end
  end
end
