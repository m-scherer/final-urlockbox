require 'rails_helper'

RSpec.describe 'As an unauthenticated user' do
  context 'When I click login' do
    it "logs me in" do
      user = User.create(email: "test@test.com", password: "test")

      visit root_path
      fill_in :email, with: user.email
      fill_in :password, with: "test"
      click_on "Submit"

      expect(current_path).to eq(root_path)
      expect(page).to have_content(user.email)
    end
  end
  context 'When I have a bad email' do
    it "doesnt log me in" do
      user = User.create(email: "test@test.com", password: "test")

      visit root_path
      fill_in :email, with: "test1@test.com"
      fill_in :password, with: "test"
      click_on "Submit"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Please ensure email and password match")
    end
  end
  context 'When I have a bad password' do
    it "doesnt log me in" do
      user = User.create(email: "test@test.com", password: "test")

      visit root_path
      fill_in :email, with: "test@test.com"
      fill_in :password, with: "test1"
      click_on "Submit"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Please ensure email and password match")
    end
  end
end
