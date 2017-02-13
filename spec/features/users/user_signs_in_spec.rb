require "rails_helper"

describe "user signs in to their account" do
  context "user visits login_path" do
    it "they enter their email and password" do
      user = User.new(first_name: "a", email: "a@email.com", password: "password", password_confirmation: "password")

      visit login_path

      fill_in "email", with: "#{user.email}"
      fill_in "password", with: "password"
      click_on "Sign In"

      expect(current_path).to eq(links_path)
      expect(page).to have_content("#{user.first_name} #{user.last_name}'s Links'")
    end
  end
end
