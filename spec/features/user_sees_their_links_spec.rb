require 'rails_helper'

RSpec.describe "As a user with links" do
  context "when I visit the links index" do
    it "I only see my links" do
      user_logs_in
      current_user = User.first
      non_user = User.create(email: "test2@test.com", password: BCrypt::Password.create("test"))
      valid_link = Link.create(title: "show", url: "http://test.com", user: current_user)
      invalid_link = Link.create(title: "hide", url: "http://test.com", user: non_user)

      visit root_path

      expect(page).to have_content("show")
      expect(page).to_not have_content("hide")
    end
  end
end
