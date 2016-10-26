require 'rails_helper'

describe User do

  describe "creating a user" do
    it 'requires an email, fullname, and password to create' do
      user = User.new(email: "email@email.edu", password: "password")
      expect(user.valid?).to eq false
      user = User.new(fullname: "fullname", password: "password")
      expect(user.valid?).to eq false
      user = User.new(email: "email@email.edu", fullname: "fullname")
      expect(user.valid?).to eq false
      user = User.new(email: "email@email.edu", fullname: "fullname", password: "password")
      expect(user.valid?).to eq true
    end

    it 'will not register an email without .edu' do
      user = User.new(email: "email@email.com", fullname: "fullname", password: "password")
      expect(user.valid?).to eq false
    end

    it 'requires a unique email' do
      User.create(email: "email@email.com", fullname: "fullname", password: "password")
      user = User.new(email: "email@email.com", fullname: "fullname", password: "password")
      expect(user.valid?).to eq false
    end

    xit 'has proposals, experiments, and comments' do
      user = User.create(email: "email@email.com", fullname: "fullname", password: "password")
      proposal = Proposal.create(proposer_id: user.id, name: "name", hypothesis: "hypothesis")
      expect(user.proposals).to include proposal
      comment = Comment.create(commentor_id: user.id, commentable_id: proposal.id, commentable_type: "proposal", content: "content")
      expect(user.comments).to include comment
      experiment = Experiment.create(experimenter_id: user.id, proposal_id: proposal.id)
      expect(user.experiments).to include experiment
    end
  end
end
