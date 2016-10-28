require "rails_helper"

feature "creating a new comment" do
  scenario "the user can create a new comment from the proposal page" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: User.last.id)
    Experiment.create(proposal_id: Proposal.last.id, experimenter_id: User.last.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2")
    visit '/'
    click_link("Log In")
    fill_in("Email", with: "email@email.edu")
    fill_in("Password", with: "password")
    click_button("Log In")

    click_link(Proposal.last.name)
    fill_in("Content", with: "This is my comment.")
    click_button("Submit")

    expect(page).to have_current_path proposal_path(Proposal.last)
    expect(page).to have_content "This is my comment."
  end

  scenario "the user can create a new comment from the experiment page" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: User.last.id)
    Experiment.create(proposal_id: Proposal.last.id, experimenter_id: User.last.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2")
    visit '/'
    click_link("Log In")
    fill_in("Email", with: "email@email.edu")
    fill_in("Password", with: "password")
    click_button("Log In")

    click_link(Proposal.last.name)
    all("a",text: "View Experiment Details").last.click
    all("form",text: "Content").last.fill_in(with: "This is my comment.")
    all('input[name="commit"]').last.click

    expect(page).to have_current_path proposal_experiment_path(Proposal.last,Experiment.last)
    expect(page).to have_content "This is my comment."
  end
end