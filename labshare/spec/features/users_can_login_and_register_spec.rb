require 'rails_helper'

feature 'Users' do
  scenario "a logged-out user can only see the login and register pages" do
    visit '/'
    expect(page).to have_current_path new_session_path
    visit '/proposals'
    expect(page).to have_current_path new_session_path
    visit '/proposals/1/experiments'
    expect(page).to have_current_path new_session_path
    visit '/proposals/new'
    expect(page).to have_current_path new_session_path
  end

  scenario "a user can register with a valid email" do
    visit '/'
    click_link("Register")
    expect(page).to have_current_path new_user_path
    fill_in("email", with: "email@email.edu")
    fill_in("fullname", with: "fullname")
    fill_in("password", with: "password")
    click_link("Register")
    expect(page).to have_current_path proposals_path
  end

  scenario "a user cannot register without a valid email" do
    visit '/'
    click_link("Register")
    fill_in("email", with: "email@email.com")
    fill_in("fullname", with: "fullname")
    fill_in("password", with: "password")
    click_link("Register")
    expect(page).to have_current_path new_user_path
  end

  scenario "a user cannot register without all information" do
    visit '/'
    click_link("Register")
    fill_in("email", with: "email@email.edu")
    fill_in("password", with: "password")
    click_link("Register")
    expect(page).to have_current_path new_user_path
  end

  scenario "a user can login" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    visit '/'
    expect(page).to have_current_path new_session_path
    fill_in("email", with: "email@email.edu")
    fill_in("password", with: "password")
    click_link("Login")
    expect(page).to have_current_path proposals_path
  end

  scenario "a user can logout" do
    User.create(email:"email@email.edu", fullname: "fullname", password: "password")
    visit '/'
    fill_in("email", with: "email@email.edu")
    fill_in("password", with: "password")
    click_link("Login")
    click_link("Log Out")
    expect(page).to have_current_path new_session_path
  end
end
