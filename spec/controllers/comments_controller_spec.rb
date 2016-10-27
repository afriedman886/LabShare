require 'rails_helper'

describe CommentsController do
  let(:user) { User.create(fullname: "kyle", email: "kyle@kyle.edu", password: "kyle")}
  let(:proposal) { Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: user.id) }
  let(:experiment) { Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion") }

  before(:each) {  User.create(fullname: "fullname", email: "email@email.edu", password: "password")
            session[:user_id] = User.last.id }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the all proposals as @proposals" do
      get :index
      expect(assigns(:proposals)).to eq(Proposal.all)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
