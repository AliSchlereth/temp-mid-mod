require "rails_helper"

describe "a visitor signs up as a user" do
  context "they visit new_user_path" do
    it "they sign up for an account" do
      visit new_user_path

    end
  end
end
