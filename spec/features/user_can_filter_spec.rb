require 'rails_helper'

RSpec.describe 'As a user', :js => :true do
  scenario 'filter unread links' do
    user_logs_in
    user = User.first
    link = Link.create(title: "In", url: "http://in.com", user: user)
    Link.create(title: "Out", url: "http://out.com", user: user, read: true)

    visit root_path
    click_on "Only Unread Links"

    expect(page).to have_text("In")
    expect(page).to_not have_text("Out")
  end
  scenario 'filter read links' do
    user_logs_in
    user = User.first
    link = Link.create(title: "In", url: "http://in.com", user: user, read: true)
    Link.create(title: "Out", url: "http://out.com", user: user)

    visit root_path
    click_on "Only Read Links"

    expect(page).to have_text("In")
    expect(page).to_not have_text("Out")
  end
end
