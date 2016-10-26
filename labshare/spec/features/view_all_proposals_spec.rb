require 'rails_helper'
require 'date'

feature "visiting the proposal view all" do
  scenario "the user sees a list proposals" do
    user = User.create(fullname: "Greg Garner", email: "gg@gmail.gov", password: "password")
    proposal = Proposal.create(name: "Proposal 1", hypothesis: "It figures stuff out", target_completion_date: Date.new(2016,12,03), proposer_id: user.id)

    visit "/proposals"

    expect(page).to have_content "Proposal 1"
    expect(page).to have_content "Greg Garner"
  end
end
