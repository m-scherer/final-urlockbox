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
end
