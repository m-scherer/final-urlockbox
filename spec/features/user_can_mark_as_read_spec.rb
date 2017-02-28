require "rails_helper"

RSpec.describe "As an authenticated user", :js => :true do
  scenario "Read a link" do
    user_logs_in
    user = User.first
    Link.create(title: "Turing", url:"http://turing.io", user: user)

    visit root_path
    click_on "Mark as Read"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text('true')
    end
  end
  scenario "Unread a link" do
    user_logs_in
    user = User.first
    Link.create(title: "Turing", url:"http://turing.io", user: user, read:true)

    visit root_path
    click_on "Mark Unread"

    within('#links-list') do
      expect(page).to have_text('false')
    end
  end
end
