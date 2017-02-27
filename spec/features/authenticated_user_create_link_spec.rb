require "rails_helper"

RSpec.describe "As an authenticated user", :js => :true do
  before(:each) do
    user_logs_in
  end

  scenario "Create a new link" do
    visit "/"
    fill_in "Title:", with: "Turing"
    fill_in "URL:", with: "http://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
      expect(page).to have_text('false')
    end
  end

  scenario "Invalid URL" do
    visit root_path
    fill_in "Title:", with: "Turing"
    fill_in "URL:", with: "turing.io"
    click_on "Add Link"

    expect(page).to have_text("Invalid URL")
    expect(Link.count).to eq(0)
    expect(page).to_not have_text("Turing")
  end

  scenario "Invalid title" do
    visit root_path
    fill_in "URL:", with: "turing.io"
    click_on "Add Link"

    expect(page).to have_text("Missing title")
    expect(Link.count).to eq(0)
  end

end
