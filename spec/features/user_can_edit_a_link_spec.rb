require "rails_helper"

RSpec.describe "As an authenticated user", :js => :true do
  scenario "Edit a link" do
    user_logs_in
    user = User.first
    Link.create(title: "Turing", url:"http://turing.io", user: user)

    visit root_path
    click_on "Edit"
    find(:css, '.link-title').set("Test")
    find(:css, '.link-url').set("http://example.com")
    click_on "Save"

    within('#links-list') do
      expect(page).to have_text("Test")
      expect(page).to have_text("http://example.com")
      expect(page).to have_text('false')
    end
  end

  scenario "Edit - invalid url" do
    user_logs_in
    user = User.first
    Link.create(title: "Turing", url:"http://turing.io", user: user)

    visit root_path
    click_on "Edit"
    find(:css, '.link-title').set("Test")
    find(:css, '.link-url').set("example.com")
    click_on "Save"

    within('#links-list') do
      expect(page).to have_text("Invalid URL")
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text('false')
    end
  end

end
