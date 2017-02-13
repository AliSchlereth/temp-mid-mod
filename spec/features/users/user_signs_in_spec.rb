require "rails_helper"

describe "user signs in to their account" do
  context "user visits login_path" do
    it "they enter their email and password" do
      user = User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")

      visit login_path

      fill_in "email", with: "#{user.email}"
      fill_in "password", with: "password"
      click_button "Sign In"

      expect(current_path).to eq(links_path)
      expect(page).to have_content("#{user.first_name} #{user.last_name}'s Links")
    end
  end
  context "unauthenticated user tries to visit links index" do
    it "redirects them to the login page with an option to sign up" do
      visit root_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Log In or Sign Up")
    end
  end

end
