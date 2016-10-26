require 'rails_helper'

describe UsersController do

  describe "GET #new" do
    it "Show login page" do
      get :new
      expect(response).to render_template(:new)
    end

    it "returns status 200" do
      get :new
      expect(response).to have_http_status 200
    end
  end

  describe "create user" do
    context "When valid user params are passed" do
      it "respond with status code 302" do
        post :create, { user: { email: "email@email.gov", fullname: "fullname", password: "password"}}
        expect(response).to have_http_status 302
      end

      it "create a new user" do
        post :create, { user: { email: "email@email.gov", fullname: "fullname", password: "password"}}
        expect(assigns(:user)).to eq User.last
      end

      it "redirect user to home index" do
        post :create, { user: { email: "email@email.gov", fullname: "fullname", password: "password"}}
        expect(response).to redirect_to(root_path)
      end

      it "create session for new user" do
        post :create, { user: { email: "email@email.gov", fullname: "fullname", password: "password"}}
        expect(session[:user_id]).to eq User.last.id
      end
    end

    context "When invalid user params are passed" do
      it "respond with rerendering the page and status code 200" do
        post :create, { user: { email: "email@email.com", fullname: "", password: "password"}}
        expect(response).to have_http_status 200
      end

      it "create a new user" do
        post :create, { user: { email: "email@email.com", fullname: "fullname", password: ""}}
        expect(assigns(:user)).to_not eq User.last
      end

      it "redirect user back to login page" do
        post :create, { user: { email: "email@email.com", fullname: "fullname", password: ""}}
        expect(response).to render_template(:new)
      end


      it "Not create session for new user" do
        post :create, { user: { email: "email@email.com", fullname: "fullname", password: "password"}}
        expect(session[:user_id]).to eq nil
      end
    end
  end
end
