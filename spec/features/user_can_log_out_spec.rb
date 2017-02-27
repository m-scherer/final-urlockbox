require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  context 'when I click logout' do
    it "logs me out" do
      user_logs_in
      visit root_path
      click_on "Log Out"

      expect(current_path).to eq(login_path)
    end
  end
end
