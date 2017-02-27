require 'rails_helper'

RSpec.describe 'As an unauthenticated user' do
  context 'when I click create account' do
    it "creates an account" do
      user = User.new(email: "test@test.com", password: "test")

      visit root_path
      click_on "Sign Up"
      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "test"
      click_on "Submit"

      expect(current_path).to eq(root_path)
      expect(page).to have_content(user.email)
    end
  end
end
