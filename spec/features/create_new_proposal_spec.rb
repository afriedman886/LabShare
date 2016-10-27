require "rails_helper"

feature "creating a new proposal" do
  scenario "the user can create a new proposal from the home page" do
    visit '/'

    click_link("New Proposal")

    expect(page).to have_current_path new_proposal_path
  end

  scenario "the user can create a new proposal from the proposal index page" do
    visit '/proposals'

    click_link("New Proposal")

    expect(page).to have_current_path new_proposal_path
  end

  xscenario "the user can submit a form to create a new proposal" do
    visit '/proposals/new'

    fill_in 'name', with: 'Testing McTesterson'
    fill_in 'hypothesis', with: 'This will work'

    click_button("Add Proposal")

    expect(page).to have_current_path proposals_path

  end

end
