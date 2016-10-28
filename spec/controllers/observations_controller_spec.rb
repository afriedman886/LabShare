require 'rails_helper'

describe ObservationsController do
  let(:user) { User.create(fullname: "kyle", email: "kyle@kyle.edu", password: "kyle")}
  let(:proposal) { Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: user.id) }
  let(:experiment) { Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion") }
  let(:observation_details) { { experiment_id: experiment.id , content: "content"} }

  before(:each) {  User.create(fullname: "fullname", email: "email@email.edu", password: "password")
            session[:user_id] = User.last.id }

  describe "Post #create for observation" do
    it "responds with status code 302" do
      post :create, { observation: observation_details}
      expect(response).to have_http_status 302
    end

    it "creates a new observation in the database" do
      expect { post :create, { observation: observation_details}}.to change {Observation.all.count}.by(1)
    end

    it "redirects to the created observation" do
     post :create, { observation: observation_details}
      expect(response).to redirect_to(proposal_experiment_path(Proposal.last,Experiment.last))
    end
  end

  describe "Post #create for observations with no content" do
    it "responds with status code 302" do
      observation_details.delete(:content)
      post :create, { observation: observation_details}
      expect(response).to have_http_status 302
    end

    it "does not create a new observations in the database" do
      observation_details.delete(:content)
      expect { post :create, { observation: observation_details}}.to_not change {Observation.all.count}
    end

    it "redirects to the experiment" do
      observation_details.delete(:content)
      post :create, { observation: observation_details}
      expect(response).to redirect_to(proposal_experiment_path(Proposal.last,Experiment.last))
    end
  end
end
