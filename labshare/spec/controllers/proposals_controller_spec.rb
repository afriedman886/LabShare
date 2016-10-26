require 'rails_helper'

describe ProposalsController do
  let!(:proposal) { Proposal.create!(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), status: "open", proposer_id: 2) }

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

  # describe "GET #new" do
  #   it "responds with status code 200" do
  #     get :new
  #     expect(response).to have_http_status 200
  #   end

  #   it "assigns a new proposal to @proposal" do
  #     get :new
  #     expect(assigns(:proposal)).to be_a_new Proposal
  #   end

  #   it "renders the :new template" do
  #     get :new
  #     expect(response).to render_template(:new)
  #   end
  # end

  # describe "POST #create" do
  #   context "when valid params are passed" do
  #     it "responds with status code 302" do
  #       post :create, { proposal: { user_throw: "rock" } }
  #       expect(response).to have_http_status 302
  #     end

  #     it "creates a new proposal in the database" do
  #       expect {post :create, { proposal: { user_throw: "rock" } }}.to change {Proposal.all.count}.by(1)
  #     end

  #     it "assigns the newly created proposal as @proposal" do
  #       post :create, { proposal: { user_throw: "paper" } }
  #       expect(assigns(:proposal)).to eq Proposal.last
  #     end

  #     it "sets a notice that the proposal was successfully created" do
  #       post :create, { proposal: { user_throw: "paper" } }
  #       expect(flash[:notice]).to eq 'Game was successfully created.'
  #     end

  #     it "redirects to the created game" do
  #       post :create, { game: { user_throw: "rock" } }
  #       expect(response).to redirect_to(game_path(Game.last))
  #     end
  #   end

  #   context "when invalid params are passed" do
  #     it "responds with status code 200" do
  #       post :create, { game: { user_throw: "pineapple" } }
  #       expect(response).to have_http_status 200
  #     end

  #     it "does not create a new game in the database" do
  #       expect { post :create, { game: { user_throw: "pineapple" } } }.not_to change{Game.all.count}
  #     end

  #     it "assigns the unsaved game as @game" do
  #       post :create, { game: { user_throw: "paper" } }
  #       expect(assigns(:game)).to eq Game.last
  #     end

  #     it "renders the :new template" do
  #       post :create, { game: { user_throw: "pineapple" } }
  #       expect(response).to render_template(:new)
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "responds with status code 302" do
  #     delete :destroy, { id: game.id }
  #     expect(response).to have_http_status 302
  #   end

  #   it "destroys the requested game" do
  #     expect { delete(:destroy, { id: game.id }) }.to change(Game, :count).by(-1)
  #   end

  #   it "sets a notice that the game was destroyed" do
  #     delete :destroy, { id: game.id }
  #     expect(flash[:notice]).to match /Game was successfully destroyed/
  #   end

  #   it "redirects to the games list" do
  #     delete :destroy, { id: game.id }
  #     expect(response).to redirect_to games_url
  #   end
  # end


end
