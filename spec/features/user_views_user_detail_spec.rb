require 'rails_helper'

feature "User views a specific user", %(
  As a user
  I want to view a user's detail page
  So that I know what videos he/she watched

  Acceptance Criteria
  [x] I must visit the url of the user.id
  [x] I must see the user's name
  [x] I must see all videos that user watched
) do
  let!(:user) { FactoryGirl.create(:user_with_videos) }

  scenario 'user visits user show page' do
    visit user_path(user)

    expect(page).to have_content user.name
    user.videos.each do |video|
      expect(page).to have_content video.title
    end
  end
end
