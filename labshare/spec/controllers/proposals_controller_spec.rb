require 'rails_helper'

describe ProposalController do
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

end
