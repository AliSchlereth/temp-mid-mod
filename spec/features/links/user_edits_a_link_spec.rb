require "rails_helper"

describe "authorized user edits their link" do
  context "they link to edit from links index" do
    it "links to edit_link_path(link)" do
      user = User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      link = user.links.create(url: "https://google.com", title:"Google")

      visit links_path
      click_on "Edit"

      expect(current_path).to eq(edit_link_path(link))
    end
  end
end
