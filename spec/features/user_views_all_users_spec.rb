require 'rails_helper'

feature "User views all users", %(
  As a user
  I want to view all users
  So that I can see them all in users index page

  Acceptance Criteria
  [x] I must see the name of each user
  [x] I should see links to the show page for each resouce
) do

  before do
    5.times { FactoryGirl.create(:user) }
  end

  scenario 'user views all users' do
    visit users_path

    User.all.each do |user|
      expect(page).to have_content user.name
    end
  end

  scenario 'user clicks on a resource and is directed to detail page' do
    visit users_path

    User.all.each do |user|
      expect(page).to have_link(user.name, href: user_path(user))
    end

    find_link(User.first.name).click
    expect(current_path).to eq user_path(User.first)
  end
end
