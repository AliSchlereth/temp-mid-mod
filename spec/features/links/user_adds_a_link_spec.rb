require "rails_helper"

describe "user adds a link" do
  context "they visit links index" do
    it "they add a link" do
      user = User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path

      fill_in "link[title]", with: "title"
      fill_in "link[url]", with: "https://google.com"
      click_button "Add Link"

      expect(page).to have_content("title")
      expect(page).to have_content("https://google.com")
      expect(page).to have_link("Mark as Read")
    end

    it "returns a flash error message with invalid url" do
      user = User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path

      fill_in "link[title]", with: "title"
      fill_in "link[url]", with: "google"
      click_button "Add Link"

      expect(page).to have_content('Url is not a valid URL')
    end
    it "returns a different flash error message with missing title" do
      user = User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path

      fill_in "link[url]", with: "https://google.com"
      click_button "Add Link"

      expect(page).to have_content("Title can't be blank")
    end 
  end
end
