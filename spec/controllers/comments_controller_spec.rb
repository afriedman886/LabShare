require 'rails_helper'

describe CommentsController do
  let(:user) { User.create(fullname: "kyle", email: "kyle@kyle.edu", password: "kyle")}
  let(:proposal) { Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: user.id) }
  let(:experiment) { Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion") }

  before(:each) {  User.create(fullname: "fullname", email: "email@email.edu", password: "password")
            session[:user_id] = User.last.id }

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Post #create for proposal" do
    it "responds with status code 200" do
      post :create, { comment: { commentable_type: "Proposal", commentable_id: proposal.id , content: "content"}}
      expect(response).to have_http_status 302
    end

    it "creates a new proposal in the database" do
      expect { post :create, { comment: { commentable_type: "Proposal", commentable_id: proposal.id , content: "content"}}}.to change {Comment.all.count}.by(1)
    end

    it "redirects to the created proposal" do
      post :create, { comment: { commentable_type: "Proposal", commentable_id: proposal.id , content: "content"}}
      expect(response).to redirect_to(proposal_path(Proposal.last))
    end
  end

  describe "Post #create for experiment" do
    it "responds with status code 200" do
      post :create, { comment: { commentable_type: "Experiment", commentable_id: experiment.id , content: "content"}}
      expect(response).to have_http_status 302
    end

    it "creates a new experiment in the database" do
      expect { post :create, { comment: { commentable_type: "Experiment", commentable_id: experiment.id , content: "content"}}}.to change {Comment.all.count}.by(1)
    end

    it "redirects to the created experiment" do
      post :create, { comment: { commentable_type: "Experiment", commentable_id: experiment.id , content: "content"}}
      expect(response).to redirect_to(proposal_experiment_path(Proposal.last,Experiment.last))
    end
  end
end
