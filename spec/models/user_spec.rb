require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "is invalid without a first_name" do
      user = User.new( last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")

      expect(user).to_not be_valid
    end
    it "is invalid without a last_name" do
      user = User.new(first_name: "a", email: "a@email.com", password: "password", password_confirmation: "password")

      expect(user).to_not be_valid
    end
    it "is invalid without a email" do
      user = User.new(first_name: "a", last_name: "s", password: "password", password_confirmation: "password")

      expect(user).to_not be_valid
    end
    it "is invalid without a password" do
      user = User.new(first_name: "a", last_name: "s",  email: "a@email.com", password_confirmation: "password")

      expect(user).to_not be_valid
    end
    it "is valid with a first_name, last_name, email, and password" do
      user = User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")

      expect(user).to be_valid
    end


  end

end

# User.create(first_name: "a", last_name: "s", email: "a@email.com", password: "password", password_confirmation: "password")
