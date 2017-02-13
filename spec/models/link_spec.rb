require "rails_helper"

describe "Link" do
  context "validations" do
    it "is invalid with non-conforming url" do
      link = Link.new(url: "wrong", title: "title")

      expect(link).to_not be_valid
    end

    it "is invalid without a title" do
      link = Link.new(url: "https://google.com")

      expect(link).to_not be_valid
    end

    it "is invalid without a title" do
      link = Link.new(url: "https://google.com", title: "Google")

      expect(link).to be_valid
    end
  end

  context "relationships" do
    it "responds to user" do
      link = Link.new(url: "https://google.com", title: "Google")

      expect(link).to respond_to(:user)
    end
  end
end
