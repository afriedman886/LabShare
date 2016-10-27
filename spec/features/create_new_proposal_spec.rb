require "rails_helper"

feature "creating a new proposal" do
  scenario "the user can create a new proposal from the home page" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    visit '/'
    click_link("Log In")
    fill_in("Email", with: "email@email.edu")
    fill_in("Password", with: "password")
    click_button("Log In")

    click_link("New Proposal")

    expect(page).to have_current_path new_proposal_path
  end

  scenario "the user can create a new proposal from the proposal index page" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    visit '/'
    click_link("Log In")
    fill_in("Email", with: "email@email.edu")
    fill_in("Password", with: "password")
    click_button("Log In")
    click_link("New Proposal")

    expect(page).to have_current_path new_proposal_path
  end

  scenario "the user can submit a form to create a new proposal" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    visit '/'
    click_link("Log In")
    fill_in("Email", with: "email@email.edu")
    fill_in("Password", with: "password")
    click_button("Log In")

    click_link("New Proposal")

    fill_in "Name", with: "Testing McTesterson"
    fill_in "Hypothesis", with: "This will work"

    click_button("Add Proposal")

    expect(page).to have_current_path proposal_path(Proposal.last.id)

  end

end
