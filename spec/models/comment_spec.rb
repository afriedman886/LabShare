require 'rails_helper'
require 'date'

describe Comment do
    let(:user) { User.create(fullname: "kyle", email: "kyle@kyle.edu", password: "kyle")}
    let(:proposal) { Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: user.id) }
    let(:experiment) { Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion") }

    describe "comment" do
      it "has a commenter" do
        comment = Comment.create(commenter_id: user.id, commentable_type: "Proposal", commentable_id: proposal.id, content: "content" )
        expect(comment.commenter).to eq user
      end

      it "has a commentable object that is a proposal" do
        comment = Comment.create(commenter_id: user.id, commentable_type: "Proposal", commentable_id: proposal.id, content: "content" )
        expect(comment.commentable).to eq proposal
      end

      it "has content" do
        comment = Comment.create(commenter_id: user.id, commentable_type: "Proposal", commentable_id: proposal.id, content: "content" )
        expect(comment.content).to eq "content"
      end

      it "has a commentable object that is an experiment" do
        comment = Comment.create(commenter_id: user.id, commentable_type: "Experiment", commentable_id: experiment.id, content: "content" )
        expect(comment.commentable).to eq experiment
      end

      it "must have a commenter to be valid" do
        comment = Comment.new( commentable_type: "Experiment", commentable_id: experiment.id, content: "content" )
        expect(comment.valid?).to eq false
      end

      it "must have a commentable to be valid" do
        comment = Comment.new( commenter_id: user.id, content: "content" )
        expect(comment.valid?).to eq false
      end

      it "must have content to be valid" do
        comment = Comment.new( commenter_id: user.id, commentable_type: "Experiment", commentable_id: experiment.id)
        expect(comment.valid?).to eq false
      end
    end
  end
