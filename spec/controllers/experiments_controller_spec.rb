require 'rails_helper'

describe ExperimentsController do
  let(:user) { User.create(fullname: "kyle", email: "kyle@kyle.edu", password: "kyle")}
  let!(:proposal) { Proposal.create!(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: 1) }
  let!(:closed_proposal) { Proposal.create!(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: 1,status: "Closed") }
  let(:experiment) { Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion") }
    let(:closed_experiment) { Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion", status: "Closed") }
  let(:experiment_details) {{ proposal_id: proposal.id, experimenter_id: user.id, materials: "Material C - 2 ; Material D - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion"} }
  let(:invalid_experiment_details) {{ materials: "Material A - 2 ; Material B - 3"}}

  before(:each) { session[:user_id] = user.id }

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { proposal_id: proposal.id, id: experiment.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct experiment as @experiment" do
       get :show, { proposal_id: proposal.id, id: experiment.id }
      expect(assigns(:experiment)).to eq(experiment)
    end

    it "renders the :show template" do
       get :show, { proposal_id: proposal.id, id: experiment.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new , { proposal_id: proposal.id}
      expect(response).to have_http_status 200
    end

    it "assigns a new experiment to @experiment" do
      get :new , { proposal_id: proposal.id}
      expect(assigns(:experiment)).to be_a_new Experiment
    end

    it "renders the :new template" do
      get :new , { proposal_id: proposal.id}
      expect(response).to render_template(:new)
    end
  end


  describe "POST #create" do

    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, {proposal_id: proposal.id, experiment: experiment_details }
        expect(response).to have_http_status 302
      end

      it "creates a new experiment in the database" do
        expect {post :create, { proposal_id: proposal.id, experiment: experiment_details }}.to change {Experiment.all.count}.by(1)
      end

      it "assigns the newly created experiment as @experiment" do
        post :create, { proposal_id: proposal.id,experiment: experiment_details }
        expect(assigns(:experiment)).to eq Experiment.last
      end

      it "sets a notice that the experiment was successfully created" do
        post :create, { proposal_id: proposal.id,experiment: experiment_details }
        expect(flash[:notice]).to eq 'Experiment was successfully created.'
      end

      it "redirects to the created experiment" do
        post :create, { proposal_id: proposal.id,experiment: experiment_details }
        expect(response).to redirect_to(proposal_experiment_path(proposal,Experiment.last))
      end
    end

    context "when proposal is closed passed" do
      it "responds with status code 302" do
        post :create, {proposal_id: closed_proposal.id, experiment: invalid_experiment_details }
        expect(response).to have_http_status 302
      end

      it "does not create a new game in the database" do
        expect { post :create, { proposal_id: closed_proposal.id,experiment: invalid_experiment_details } }.not_to change{Experiment.all.count}
      end

      it "redirects to the proposal path" do
        post :create, { proposal_id: closed_proposal.id,experiment: invalid_experiment_details }
        expect(response).to redirect_to(proposal_path(closed_proposal))
      end
    end
  end

 describe "GET #edit" do
    it "responds with status code 200" do
    get :edit , { proposal_id: proposal.id , id: experiment.id}
    expect(response).to have_http_status 200
  end

  it "assigns a new experiment to @experiment" do
    get :edit , { proposal_id: proposal.id,id: experiment.id}
    expect(assigns(:experiment)).to be_a Experiment
  end

  it "renders the :new template" do
    get :edit , { proposal_id: proposal.id, id: experiment.id}
    expect(response).to render_template(:edit)
  end
 end

 describe "PUT #update" do

    context "when valid params are passed" do
      it "responds with status code 302" do
        put :update, {proposal_id: proposal.id, id: experiment.id, experiment: experiment_details }
        expect(response).to have_http_status 302
      end

      it "updates a new experiment in the database" do
        experiment = Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion", status: "Closed")
        expect {put :update, {proposal_id: proposal.id, id: experiment.id, experiment: experiment_details }}.not_to change {Experiment.all.count}
      end

      it "assigns the newly updated experiment as @experiment" do
       put :update, {proposal_id: proposal.id, id: experiment.id, experiment: experiment_details }
        expect(assigns(:experiment)).to eq experiment
      end

      it "redirects to the experiment" do
        put :update, {proposal_id: proposal.id, id: experiment.id, experiment: experiment_details }
        expect(response).to redirect_to(proposal_experiment_path(proposal,Experiment.last))
      end
    end

    context "when experiment is closed passed" do
      it "responds with status code 302" do
        closed_experiment = Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion", status: "Closed")
        put :update, {proposal_id: proposal.id,  id: closed_experiment.id, experiment: experiment_details }
        expect(response).to have_http_status 302
      end

      it "does not create a new game in the database" do
        closed_experiment = Experiment.create(proposal_id: proposal.id, experimenter_id: user.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion", status: "Closed")
        expect { put :update, {proposal_id: proposal.id,  id: closed_experiment.id, experiment: experiment_details }  }.not_to change{Experiment.all.count}
      end

      it "redirects to the experiment path" do
        put :update,{proposal_id: proposal.id,  id: closed_experiment.id, experiment: experiment_details }
        expect(response).to redirect_to(proposal_experiment_path(proposal,Experiment.last))
      end
    end
  end

end


#### UPDATE ROUTES