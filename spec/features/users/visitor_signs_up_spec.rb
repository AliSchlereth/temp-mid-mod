require "rails_helper"

describe "a visitor signs up as a user" do
  context "they visit new_user_path" do
    it "they sign up for an account" do

      visit new_user_path

      fill_in "user[first_name]", with: 'A'
      fill_in "user[last_name]", with: 'S'
      fill_in "user[email]", with: 'email@email.com'
      fill_in "user[password]", with: 'password'
      fill_in "user[password_confirmation]", with: 'password'
      click_on "Create Account"

      expect(page).to have_content("A S's Links")
    end
  end
end
