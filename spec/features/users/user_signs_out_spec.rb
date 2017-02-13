require "rails_helper"

describe "signed in user signs out" do
  context "user signs out" do
    it "redirects them to the login_path" do
      user = User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      click_on "Sign Out"

      expect(current_path).to eq(login_path)
    end
  end
end
