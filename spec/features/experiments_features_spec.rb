require "rails_helper"

feature "creating a new proposal" do
  scenario "the user can create a new experiment from the proposal page" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: User.last.id)
    visit '/'
    click_link("Log In")
    fill_in("Email", with: "email@email.edu")
    fill_in("Password", with: "password")
    click_button("Log In")

    click_link(Proposal.last.name)
    click_link("Start New Experiment")

    expect(page).to have_current_path new_proposal_experiment_path(Proposal.last)
  end

  scenario "the user can create a new experiment from the proposal page" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: User.last.id)
    visit '/'
    click_link("Log In")
    fill_in("Email", with: "email@email.edu")
    fill_in("Password", with: "password")
    click_button("Log In")

    click_link(Proposal.last.name)
    click_link("Start New Experiment")
    fill_in("Procedure", with: "Do This")
    click_button("Create Experiment")

    expect(page).to have_current_path proposal_experiment_path(Proposal.last,Experiment.last)
  end

  scenario "a user that did not create an experiment can view an experiment but not edit it" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    User.create(email:"kyle@kyle.edu", fullname: "fullname", password: "password")
    Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: User.last.id)
    Experiment.create(proposal_id: Proposal.last.id, experimenter_id: User.last.id , materials: "Material A - 2 ; Material B - 3", procedure: "1. thing one ; 2. thing 2", conclusion: "conclusion")
    visit '/'
    click_link("Log In")
    fill_in("Email", with: "kyle@kyle.edu")
    fill_in("Password", with: "password")
    click_button("Log In")

    click_link(Proposal.last.name)

    all("a",text: "View Experiment Details").last.click

    expect(page).to have_current_path proposal_experiment_path(Proposal.last,Experiment.last)
    expect(page).to_not have_content "/Edit Experiment Details/"

  end

  scenario "the creating user can see the option to edit a proposal " do
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

    expect(page).to have_content "Edit Experiment Details"

  end

  scenario "the creating user can edit a proposal " do
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
    click_link("Edit Experiment Details")

    expect(page).to have_current_path edit_proposal_experiment_path(Proposal.last,Experiment.last)

    fill_in("Conclusion", with: "this is my conclusion")
    click_button("Update Experiment")

    expect(page).to have_current_path proposal_experiment_path(Proposal.last,Experiment.last)

    expect(page).to have_content "this is my conclusion"
  end

end
