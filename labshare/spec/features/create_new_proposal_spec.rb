require "rails_helper"

feature "creating a new proposal" do
  xscenario "the user can create a new proposal from the home page" do
    visit '/'

    click_link("New Proposal")

    expect(page).to have_current_path new_proposal_path
  end

  xscenario "the user can create a new proposal from the proposal index page" do
    visit '/proposals'

    click_link("New Proposal")

    expect(page).to have_current_path new_proposal_path
  end
end
