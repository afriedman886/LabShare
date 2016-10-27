require 'rails_helper'

describe ProposalsController do
  let!(:proposal) { Proposal.create!(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: 2) }
  # let(:user) {User.new(fullname: "fullname", email: "email", password: "password")}
  # before { session[:user_id] = User.last.id}
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

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: proposal.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct proposal as @proposal" do
      get :show, { id: proposal.id }
      expect(assigns(:proposal)).to eq(proposal)
    end

    it "renders the :show template" do
      get :show, { id: proposal.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new proposal to @proposal" do
      get :new
      expect(assigns(:proposal)).to be_a_new Proposal
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  proposal_details = {name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03)}

  describe "POST #create" do

    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, { proposal: proposal_details }
        expect(response).to have_http_status 302
      end

      it "creates a new proposal in the database" do
        expect {post :create, { proposal: proposal_details }}.to change {Proposal.all.count}.by(1)
      end

      it "assigns the newly created proposal as @proposal" do
        post :create, { proposal: proposal_details }
        expect(assigns(:proposal)).to eq Proposal.last
      end

      it "sets a notice that the proposal was successfully created" do
        post :create, { proposal: proposal_details }
        expect(flash[:notice]).to eq 'Proposal was successfully created.'
      end

      it "redirects to the created proposal" do
        post :create, { proposal: proposal_details }
        expect(response).to redirect_to(proposal_path(Proposal.last))
      end
    end

    invalid_proposal_details = {hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03)}

    context "when invalid params are passed" do
      it "responds with status code 200" do
        post :create, { proposal: invalid_proposal_details }
        expect(response).to have_http_status 200
      end

      it "does not create a new game in the database" do
        expect { post :create, { proposal: invalid_proposal_details } }.not_to change{Proposal.all.count}
      end

      it "renders the :new template" do
        post :create, { proposal: invalid_proposal_details }
        expect(response).to render_template(:new)
      end
    end
  end

end
