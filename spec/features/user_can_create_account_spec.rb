require 'rails_helper'

RSpec.describe 'As an unauthenticated user' do
  context 'when I click create account' do
    it "creates an account" do
      user = User.new(email: "test@test.com", password: "test")

      visit root_path
      click_on "Sign Up"
      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "test"
      fill_in "user_password_confirmation", with: "test"
      click_on "Submit"

      expect(current_path).to eq(root_path)
      expect(page).to have_content(user.email)
    end
  end
  context 'when the passwords dont match' do
    it "doesn't let me create an account" do
      user = User.new(email: "test@test.com", password: "test")

      visit root_path
      click_on "Sign Up"
      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "test"
      fill_in "user_password_confirmation", with: "dontpass"
      click_on "Submit"

      expect(current_path).to eq(signup_path)
      expect(User.count).to eq(0)
      expect(page).to have_content("Please ensure passwords match")
    end
  end

  context 'when the email isnt unique' do
    it "doesn't let me create an account" do
      User.create(email: "test@test.com", password: "test")
      user = User.new(email: "test@test.com", password: "test")

      visit root_path
      click_on "Sign Up"
      fill_in "user_email", with: "test@test.com"
      fill_in "user_password", with: "test"
      fill_in "user_password_confirmation", with: "test"
      click_on "Submit"

      expect(current_path).to eq(signup_path)
      expect(User.count).to eq(1)
      expect(page).to have_content("Please select a unique email")
    end
  end

end
