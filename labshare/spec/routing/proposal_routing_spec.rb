require "rails_helper"

RSpec.describe "Routing to proposals", :type => :routing do
  it "routes GET /proposals to proposals#index" do
    expect(:get => "/proposals").to route_to("proposals#index")
  end

  it "routes GET /proposals/new to proposals#new" do
    expect(:get => "/proposals/new").to route_to("proposals#new")
  end

  it "routes GET /proposals/1 to proposals#show" do
    expect(:get => "/proposals/1").to route_to("proposals#show")
  end

  it "routes POST /proposals to proposals#create" do
    expect(:post => "/proposals").to route_to("proposals#create")
  end

  it "routes GET /proposals/1/edit to proposals#edit" do
    expect(:get => "/proposals/1/edit").to route_to("proposals#edit")
  end

end
