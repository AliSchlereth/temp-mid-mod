require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    link = user.links.create(url: "https://google.com", title:"Google")

    visit "/"
    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
