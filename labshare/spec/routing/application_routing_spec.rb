require "rails_helper"

RSpec.describe "Routing to the application", :type => :routing do
  it "GET / routes to #index" do
    expect(:get => "/").to route_to("proposals#homeindex")
  end
end
